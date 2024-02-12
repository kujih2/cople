package kr.spring.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import kr.spring.interceptor.LoginCheckInterceptor;
import kr.spring.websocket.SocketHandler;
//자바코드 기반설정 클래스
@Configuration
@EnableWebSocket
public class AppConfig implements WebMvcConfigurer,WebSocketConfigurer{
	private LoginCheckInterceptor loginCheck;
	

	@Bean
	public LoginCheckInterceptor interceptor2() {
		loginCheck = new LoginCheckInterceptor();
		return loginCheck;
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		//LoginCheckInterceptor 설정
		registry.addInterceptor(loginCheck)
				.addPathPatterns("/member/myPage")
				.addPathPatterns("/member/write")
				.addPathPatterns("/member/update")
				.addPathPatterns("/member/delete")
				.addPathPatterns("/wiki/update")
				.addPathPatterns("/wiki/undo")
				.addPathPatterns("/wiki/delete")
				.addPathPatterns("/market/write")
				.addPathPatterns("/market/modify")
				.addPathPatterns("/market/delete")
				.addPathPatterns("/market/marketChatRoom")
				.addPathPatterns("/market/marketProfile")
				;
	}
	
	@Bean
	public TilesConfigurer tilesConfigurer() {
		final TilesConfigurer configurer = new TilesConfigurer();
		//tilesder.wml의 경로와 파일명 지정
		configurer.setDefinitions(new String[] {
				"/WEB-INF/tiles-def/main.xml",
				"/WEB-INF/tiles-def/LKW.xml",
				"/WEB-INF/tiles-def/LKW2.xml",
				"/WEB-INF/tiles-def/SHJ.xml",
				"/WEB-INF/tiles-def/HJW.xml",
				"/WEB-INF/tiles-def/JJH.xml",
				"/WEB-INF/tiles-def/SHH.xml"
				});
		configurer.setCheckRefresh(true);
		return configurer;
	}
	@Bean
	public TilesViewResolver tilesViewResolver() {
		final TilesViewResolver tilesViewResolver = new TilesViewResolver();
		tilesViewResolver.setViewClass(TilesView.class);
		return tilesViewResolver;
	}
	//웹소켓 셋팅
		@Override
		public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
			                                                        //허용 도메인 지정
			registry.addHandler(new SocketHandler(), "message-ws").setAllowedOrigins("*");
		}
	
}
 