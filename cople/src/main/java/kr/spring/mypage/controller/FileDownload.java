package kr.spring.mypage.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.support.WebApplicationContextUtils;

import kr.spring.matching.service.MatchingService;
import kr.spring.matching.vo.AdviceVO;

@WebServlet("/download.do")
public class FileDownload extends HttpServlet{
	
	
	private static final String UPLOAD_PATH = "/upload";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int advice_num = Integer.parseInt(request.getParameter("advice_num"));
        doHandle(request, response, advice_num);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int advice_num = Integer.parseInt(request.getParameter("advice_num"));
        doHandle(request, response, advice_num);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response, int advice_num) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		MatchingService matchingService = (MatchingService) WebApplicationContextUtils
                .getRequiredWebApplicationContext(getServletContext()).getBean(MatchingService.class);
		AdviceVO adviceVO = matchingService.selectAdvice(advice_num);

		String file_repo = request.getServletContext().getRealPath(UPLOAD_PATH);
		String fileName = adviceVO.getFilename();
		fileName=fileName.toString().substring(37);
		System.out.println("fileName="+fileName);
		
		OutputStream out = response.getOutputStream(); // response에서 OutputStream 객체를 가져옴
		String downFile = file_repo+"/"+fileName;
		File f=new File(downFile);
		
		// 파일을 다운로드할 수 있게 설정
        response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+fileName);
		FileInputStream in=new FileInputStream(f);
		// 버퍼 기능을 이용해 파일에서 버퍼로 데이터를 읽어와 한꺼번에 출력함
        byte[] buffer=new byte[1024*8];
		while(true) {
			int count=in.read(buffer);
			if(count==-1)
				break;
			out.write(buffer,0,count);
		}
		in.close();
		out.close();
	}

}
