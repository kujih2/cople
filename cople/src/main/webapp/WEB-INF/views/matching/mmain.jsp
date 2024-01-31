<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.overlay-text {
	position: absolute;
	bottom: 0;
	left: 50%;
	transform: translateX(-50%);
	color: white;
	font-size: 18px;
	font-weight: bold;
	text-align: center;
	padding: 10px;
	border-radius: 5px;
	display: none;
	/* 배경 스타일 추가 */
	background-color: rgba(0, 0, 0, 0.7);
	backdrop-filter: blur(5px); /* 텍스트 배경에 블러 효과 추가 */
	-webkit-backdrop-filter: blur(5px); /* Safari 지원을 위한 접두사 사용 */
}

.chart-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between; /* 또는 필요에 따라 다른 정렬을 사용하세요 */
}

.chart {
	width: calc(33.33% - 20px); /* 3개씩 가로로 배치하고 간격을 조절 */
	margin: 10px;
}

.chart2 {
	width: calc(50% - 20px); /* 2개씩 가로로 배치하고 간격을 조절 */
	margin: 10px;
}

/* donutchart3과 donutchart6 크기 조절 및 간격 조절 */
#donutchart3, #donutchart6 {
	width: calc(50% - 20px);
	margin-bottom: 10px; /* 설명 텍스트와의 간격 조절 */
}

/* 설명 텍스트에 대한 스타일 추가 */
.chart-description {
	margin-top: -10px; /* 차트와 설명 텍스트 간의 간격을 조절 */
	font-size: 16px;
	color: #555;
	text-align: center;
}

.echartMain {
	display: flex;
}

#container1, #container2 {
	flex: 1;
	margin-right: 10px; /* 각 차트 컨테이너 사이의 간격 조절 */
}

.chart-title {
	text-align: center; /* 텍스트 가운데 정렬 */
	font-size: 16px; /* 원하는 폰트 사이즈로 조절 */
	margin-top: 5px; /* 제목 위쪽 간격 조절 */
}
 .chartButton {
        display: inline-block;
        padding: 10px 20px;
        font-size: 16px;
        font-weight: bold;
        text-align: center;
        text-decoration: none;
        background-color: #3498db; /* 배경색 설정, 원하는 색상으로 변경 가능 */
        color: #ffffff; /* 텍스트 색상 설정, 원하는 색상으로 변경 가능 */
        border-radius: 5px;
        border: 2px solid #2980b9; /* 테두리 설정, 원하는 색상으로 변경 가능 */
        transition: background-color 0.3s, color 0.3s;
    }

    .chartButton:hover {
        background-color: #2980b9; /* 마우스 호버 시 배경색 변경 */
        color: #ffffff; /* 마우스 호버 시 텍스트 색상 변경 */
    }
</style>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script>
function emp_register() {
    var width = '700';
    var height = '700';

    var left = (window.innerWidth - width) / 2;
    var top = (window.innerHeight - height) / 2;

    // 팝업 창 열기
    var popupWindow = window.open("emp_register", "현직자 신청하기", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",scrollbars=yes");

    // 팝업 내용 스타일 조절
    if (popupWindow) {
        popupWindow.onload = function () {
            var popupContent = popupWindow.document.body; // 팝업 창 내용이 들어가는 부분
            popupContent.style.overflowY = 'auto'; // 세로 스크롤바를 항상 표시하도록 설정
            popupContent.style.maxHeight = '80vh'; // 팝업 창의 최대 높이를 설정 (가능하면 vh 단위 사용)
        };
    }
}
function my_emp_register() {
    var width = '700';
    var height = '700';

    var left = (window.innerWidth - width) / 2;
    var top = (window.innerHeight - height) / 2;

    // 팝업 창 열기
    var popupWindow = window.open("my_emp_register", "현직자 신청하기", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top + ",scrollbars=yes");

    // 팝업 내용 스타일 조절
    if (popupWindow) {
        popupWindow.onload = function () {
            var popupContent = popupWindow.document.body; // 팝업 창 내용이 들어가는 부분
            popupContent.style.overflowY = 'auto'; // 세로 스크롤바를 항상 표시하도록 설정
            popupContent.style.maxHeight = '80vh'; // 팝업 창의 최대 높이를 설정 (가능하면 vh 단위 사용)
        };
    }
}
$(document).ready(function(){
	
	$('#moreChart').click(function(){
		$(this).hide();
		$('#chartBundle').show();
		$('#hideChart').show();
});
	$('#hideChart').click(function(){
		$(this).hide();
		$('#chartBundle').hide();
		$('#moreChart').show();
	})
	
})
</script>
<script
	src="https://cdn.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>

<c:if test="${user.auth==1}">
	<button class="emp_register" onclick="emp_register()">현직자 신청하기</button>
</c:if>
<c:if test="${user.auth==2}">
	<button class="my_emp_register" onclick="my_emp_register()">나의
		현직자 신청 정보 보기</button>
</c:if>
<h2>취업 현황 지도</h2>


<div id="map" style="width: 100%; height: 350px;"></div>
<br>
<h2>취업 현황 데이터</h2>


<div class="echartMain">
	<div id="container1" style="height: 300px"></div>
	<div id="container2" style="height: 300px"></div>
</div>
<br><br><br>
<button id="moreChart" class="chartButton">데이터 차트 더 보기</button>
<button id="hideChart" class="chartButton" style="display: none;">데이터 차트 접어두기</button>

<div class="chart-container clearfix" id="chartBundle"
	style="display: none;">
	<div class="chart" id="donutchart1"></div>
	<div class="chart" id="donutchart2"></div>
	<div class="chart" id="donutchart4"></div>
	<div class="chart" id="donutchart5"></div>
	<div class="chart" id="donutchart7"></div>
	<div class="chart" id="donutchart8"></div>
	<div class="chart" id="donutchart9"></div>
	<div class="chart" id="donutchart10"></div>
	<div class="chart" id="donutchart11"></div>
	<div class="chart" id="barchart_values"
		style="width: 900px; height: 300px;"></div>
</div>


<script type="text/javascript">
		
		//empListJson은 JSP에서 가져온 JSON 문자열입니다.
		var empListJson = '${empListJson}';
		var empList = JSON.parse(empListJson);
		
		// 필드 값들의 개수를 저장할 객체 생성
		var fieldCounts = {};
		
		// empList를 순회하며 field 값들의 개수를 증가
		empList.forEach(function (emp) {
		  var fieldString = emp.field.toString();
		
		  if (fieldCounts.hasOwnProperty(fieldString)) {
		    fieldCounts[fieldString]++;
		  } else {
		    fieldCounts[fieldString] = 1;
		  }
		});
		
		// data 배열 동적 생성
		var data = [];
		for (var field in fieldCounts) {
		  if (fieldCounts.hasOwnProperty(field)) {
		    data.push({
		      value: fieldCounts[field],
		      name: convertFieldToString(field)
		    });
		  }
		}
		
		console.log('Generated Data:', data);

		// 필드 값을 문자열로 변환하는 함수
		function convertFieldToString(fieldValue) {
		  switch (parseInt(fieldValue)) {
		    case 0:
		      return 'SI';
		    case 1:
		      return 'SM';
		    case 2:
		      return '솔루션';
		    case 3:
		      return '서비스';
		    case 4:
		      return '기타(IT)';
		    case 5:
		      return '기타(非IT)';
		    default:
		      console.log('Unknown Field Value:', fieldValue);
		      return 'Unknown';
		  }
		}
	
		var dom = document.getElementById('container1');
		var myChart = echarts.init(dom, null, {
		  renderer: 'canvas',
		  useDirtyRect: false
		});
		var app = {};
		
		var option;
		
		option = {
				title: {  // 이 부분이 추가된 부분입니다.
				    text: '지원직무',  // 제목 텍스트
				    left: 'center',  // 가로 위치 (센터 정렬)
				    top: '90%',  // 세로 위치 (5% 위치)
				    textStyle: {
				      fontSize: 25,  // 원하는 폰트 사이즈로 조절
				      fontWeight: 'bold'
				    }
				  },
		tooltip: {
		trigger: 'item'
		},
		legend: {
		top: '5%',
		left: 'center'
		},
		series: [
		{
		  name: '지원직무',
		  type: 'pie',
		  radius: ['40%', '70%'],
		  avoidLabelOverlap: false,
		  itemStyle: {
		    borderRadius: 10,
		    borderColor: '#fff',
		    borderWidth: 2
		  },
		  label: {
		    show: false,
		    position: 'center'
		  },
		  emphasis: {
		    label: {
		      show: true,
		      fontSize: 40,
		      fontWeight: 'bold'
		    }
		  },
		  labelLine: {
		    show: false
		  },
		  data: data
		}
		]
		};
		
		if (option && typeof option === 'object') {
		  myChart.setOption(option);
		}
		
		window.addEventListener('resize', myChart.resize);
</script>
<script type="text/javascript">
		
		//empListJson은 JSP에서 가져온 JSON 문자열입니다.
		var empListJson = '${empListJson}';
		var empList = JSON.parse(empListJson);
		
		// 필드 값들의 개수를 저장할 객체 생성
		var salaryCounts = {};
		
		// empList를 순회하며 field 값들의 개수를 증가
		empList.forEach(function (emp) {
		  var salaryString = emp.salary.toString();
		
		  if (salaryCounts.hasOwnProperty(salaryString)) {
		    salaryCounts[salaryString]++;
		  } else {
		    salaryCounts[salaryString] = 1;
		  }
		});
		
		// data 배열 동적 생성
		var data = [];
		for (var salary in salaryCounts) {
		  if (salaryCounts.hasOwnProperty(salary)) {
		    data.push({
		      value: salaryCounts[salary],
		      name: convertFieldToString(salary)
		    });
		  }
		}

		// 필드 값을 문자열로 변환하는 함수
		function convertFieldToString(salaryValue) {
		  switch (salaryValue) {
		    case '0':
		      return '~2,600만원';
		    case '1':
		      return '2,600~3,000만원';
		    case '2':
		      return '3,000~3,400만원';
		    case '3':
		      return '3,400~3,800만원';
		    case '4':
		      return '3,800~4,200만원';
		    case '5':
		      return '4,200만원~';
		    default:
		      return 'Unknown';
		  }
		}
	
		var dom = document.getElementById('container2');
		var myChart = echarts.init(dom, null, {
		  renderer: 'canvas',
		  useDirtyRect: false
		});
		var app = {};
		
		var option;
		
		option = {
				title: {  // 이 부분이 추가된 부분입니다.
				    text: '연봉(초봉)',  // 제목 텍스트
				    left: 'center',  // 가로 위치 (센터 정렬)
				    top: '90%',  // 세로 위치 (5% 위치)
				    textStyle: {
				      fontSize: 25,  // 원하는 폰트 사이즈로 조절
				      fontWeight: 'bold'
				    }
				  },
		tooltip: {
		trigger: 'item'
		},
		legend: {
		top: '5%',
		left: 'center'
		},
		series: [
		{
		  name: '연봉(초봉)',
		  type: 'pie',
		  radius: ['40%', '70%'],
		  avoidLabelOverlap: false,
		  itemStyle: {
		    borderRadius: 10,
		    borderColor: '#fff',
		    borderWidth: 2
		  },
		  label: {
		    show: false,
		    position: 'center'
		  },
		  emphasis: {
		    label: {
		      show: true,
		      fontSize: 40,
		      fontWeight: 'bold'
		    }
		  },
		  labelLine: {
		    show: false
		  },
		  data: data
		}
		]
		};
		
		if (option && typeof option === 'object') {
		  myChart.setOption(option);
		}
		
		window.addEventListener('resize', myChart.resize);
</script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e592360b98e7e7af7c0620352a4709c&libraries=clusterer"></script>
<script>
	var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	    center : new kakao.maps.LatLng(37.50642899040794, 126.97303712266464), // 지도의 중심좌표 
	    level : 10 // 지도의 확대 레벨 
	});
	
	// 마커 클러스터러를 생성합니다 
	var clusterer = new kakao.maps.MarkerClusterer({
	    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	    averageCenter: false, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	    minLevel: 13 // 클러스터 할 최소 지도 레벨 
	});
	
	// 데이터를 가져오기 위해 jQuery를 사용합니다
	// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
	 /* 모델에서 전달한 JSON 데이터 가져오기 */
	var ajaxMapData = JSON.parse('${ajaxMapData}');
	
	/* JSON 문자열을 JavaScript 객체로 파싱 */
    var jsonData = ajaxMapData.positions;
       
	
   
  	
    // 데이터에서 좌표 값을 가지고 마커를 표시합니다
    // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
    
   
    var markers = jsonData.map(function(position) {
    var userNum = position.user_num;
       
	var content ='<div class="mapProfile" data-num="'+userNum+'">'+
    '<a><img src="${pageContext.request.contextPath}/matching/viewProfile?userNum='+userNum+'" width="40" height="40" class="my-photo"></a>'
    + ' <div class="profileDetail">'+'<p></p>'+'</div></div>';
    	
    	return new kakao.maps.CustomOverlay({
            position: new kakao.maps.LatLng(position.lat, position.lng),
            content:content
        });
       
    });
    // 클러스터러에 마커들을 추가합니다
    clusterer.addMarkers(markers);
    
    
    
    
    // 이미지 컨테이너 요소를 가져옵니다.
    const imageContainer = document.querySelector('.my-photo');

    // 텍스트를 오버레이하는 요소를 가져옵니다.
    const overlayText = document.querySelector('.overlay-text');

    // 마우스가 이미지에 진입했을 때 텍스트를 보여주는 이벤트를 추가합니다.
    imageContainer.addEventListener('mouseenter', () => {
        overlayText.style.display = 'block';
    });

    // 마우스가 이미지에서 빠져나갈 때 텍스트를 숨기는 이벤트를 추가합니다.
    imageContainer.addEventListener('mouseleave', () => {
        overlayText.style.display = 'none';
    });
 

	$(document).on('mouseenter', '.my-photo', function() {
	    // 이미지에 마우스를 가져다 댔을 때의 동작
	    // 여기서는 해당 이미지를 감싸는 부모 요소의 클래스를 찾아 data-user-num 속성의 값을 설정합니다.
	    var userNum = $(this).closest('.mapProfile').data('num');
	    $(this).closest('.mapProfile').find('p').text(userNum);
	});
	
	$(document).on('mouseleave', '.my-photo', function() {
	    // 이미지에서 마우스가 빠져나갈 때의 동작
	    // 여기서는 텍스트를 원래대로 설정하거나 숨기는 등의 동작을 추가할 수 있습니다.
	    $(this).closest('.mapProfile').find('p').text('');
	});
</script>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	
	
	
		var empListJson = '${empListJson}'; // JSP에서 문자열 그대로 가져옴
		
	    var empList = JSON.parse(empListJson);
		
	 	// comsize 값들의 개수를 저장할 객체 생성
	    var comsizeCounts = {};
		var comsizeCount=0;
	    // empList를 순회하며 comsize 값들의 개수를 증가
	    empList.forEach(function (emp) {
	    	comsizeCount++;
	      if (comsizeCounts.hasOwnProperty(emp.comsize)) {
	        comsizeCounts[emp.comsize]++;
	      } else {
	        comsizeCounts[emp.comsize] = 1;
	      }
	    });

	 	// comsizeCounts 객체를 사용하여 값들을 변수에 연결
	    var 중소 = comsizeCounts['중소'];
	    var 중견 = comsizeCounts['중견'];
	   	var 스타트업 = comsizeCounts['스타트업'];
	    var 대기업 = comsizeCounts['대기업'];
			 


	    google.charts.load("current", {packages:["corechart"]});
	    google.charts.setOnLoadCallback(drawChart);

	    function drawChart() {
	        // 새로운 배열을 만들어 comsizeCounts 객체의 값을 배열로 변환
	        var dataArray = Object.entries(comsizeCounts);

	        // 배열의 첫 번째 열을 추가하여 2차원 배열 형태로 만듦
	        dataArray.unshift(['Comsize', 'Count']);

	        var data = google.visualization.arrayToDataTable(dataArray);

	        var options = {
	            title: '회사 규모 (표본 :'+comsizeCount+'명)',
	            pieHole: 0.4,
	        };

	        var chart = new google.visualization.PieChart(document.getElementById('donutchart1'));
	        chart.draw(data, options);
	    }
</script>
<script>
	var empListJson = '${empListJson}'; // JSP에서 문자열 그대로 가져옴
	
	var empList = JSON.parse(empListJson);
	
		// compeople 값들의 개수를 저장할 객체 생성
	var compeopleCounts = {};
	var compeopleCount=0;
	// empList를 순회하며 compeople 값들의 개수를 증가
	empList.forEach(function (emp) {
		compeopleCount++;
	  if (compeopleCounts.hasOwnProperty(emp.compeople)) {
	    compeopleCounts[emp.compeople]++;
	  } else {
	    compeopleCounts[emp.compeople] = 1;
	  }
	});
	
		// compeopleCounts 객체를 사용하여 값들을 변수에 연결
		var _5_10인 = compeopleCounts['5~10인'];
		var _10_30인 = compeopleCounts['10~30인'];
		var _30_50인 = compeopleCounts['30~50인'];
		var _50_100인 = compeopleCounts['50~100인'];
		var _100인_이상 = compeopleCounts['100인 이상'];

	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
	    // 새로운 배열을 만들어 compeopleCounts 객체의 값을 배열로 변환
	    var dataArray = Object.entries(compeopleCounts);
	
	    // 배열의 첫 번째 열을 추가하여 2차원 배열 형태로 만듦
	    dataArray.unshift(['Compeople', 'Count']);
	
	    var data = google.visualization.arrayToDataTable(dataArray);
	
	    var options = {
	        title: '기업 규모 (표본 :'+compeopleCount+'명)',
	        pieHole: 0.4,
	    };
	
	    var chart = new google.visualization.PieChart(document.getElementById('donutchart2'));
	    chart.draw(data, options);
	}
	
</script>

<script>
		var empListJson = '${empListJson}'; // JSP에서 문자열 그대로 가져옴
		
		var empList = JSON.parse(empListJson);
		
		// role 값들의 개수를 저장할 객체 생성
		var roleCounts = {};
		var roleCount = 0;
		
		// empList를 순회하며 role 값들의 개수를 증가
		empList.forEach(function (emp) {
		  roleCount++;
		  var roleString = convertFieldToString(emp.role);
		  
		  if (roleCounts.hasOwnProperty(roleString)) {
		    roleCounts[roleString]++;
		  } else {
		    roleCounts[roleString] = 1;
		  }
		});
		
		// 필드 값을 문자열로 변환하는 함수
		function convertFieldToString(roleValue) {
			console.log('roleValue:', roleValue); // 콘솔에 roleValue 출력
		  switch (roleValue) {
		    case '0':
		      return '백엔드';
		    case '1':
		      return '프론트엔드';
		    case '2':
		      return '풀스택';
		    case '3':
		      return '데브옵스';
		    case '4':
		      return '임베디드';
		    case '5':
		      return 'DBA';
		    case '6': 
		      return '기타';
		    default:
		      return 'Unknown';
		  }
		}
		
		google.charts.load("current", {packages:["corechart"]});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
		  // 새로운 배열을 만들어 roleCounts 객체의 값을 배열로 변환
		  var dataArray = Object.entries(roleCounts);
			console.log(dataArray);
		
		  // 배열의 첫 번째 열을 추가하여 2차원 배열 형태로 만듦
		  dataArray.unshift(['Role', 'Count']);
		
		  var data = google.visualization.arrayToDataTable(dataArray);
		
		  var options = {
		    title: '지원 직무 (표본 :' + roleCount + '명)',
		    pieHole: 0.4,
		  };
		
		  var chart = new google.visualization.PieChart(document.getElementById('donutchart4'));
		  chart.draw(data, options);
		}
		
</script>
<script>
	
		var empListJson = '${empListJson}'; // JSP에서 문자열 그대로 가져옴
		
	    var empList = JSON.parse(empListJson);
		
	 	// career 값들의 개수를 저장할 객체 생성
	    var careerCounts = {};
		var careerCount=0;
	    // empList를 순회하며 career 값들의 개수를 증가
	    empList.forEach(function (emp) {
	    	careerCount++;
	      if (careerCounts.hasOwnProperty(emp.career)) {
	        careerCounts[emp.career]++;
	      } else {
	        careerCounts[emp.career] = 1;
	      }
	    });

	 	// careerCounts 객체를 사용하여 값들을 변수에 연결
	    var 신입 = careerCounts['신입'];
	    var 중고신입 = careerCounts['중고신입'];
	   	var 기타 = careerCounts['기타'];
			 


	    google.charts.load("current", {packages:["corechart"]});
	    google.charts.setOnLoadCallback(drawChart);

	    function drawChart() {
	        // 새로운 배열을 만들어 comsizeCounts 객체의 값을 배열로 변환
	        var dataArray = Object.entries(careerCounts);

	        // 배열의 첫 번째 열을 추가하여 2차원 배열 형태로 만듦
	        dataArray.unshift(['Career', 'Count']);

	        var data = google.visualization.arrayToDataTable(dataArray);

	        var options = {
	            title: '경력 (표본 :'+careerCount+'명)',
	            pieHole: 0.4,
	        };

	        var chart = new google.visualization.PieChart(document.getElementById('donutchart5'));
	        chart.draw(data, options);
	    }
</script>

<script>
		var empListJson = '${empListJson}'; // JSP에서 문자열 그대로 가져옴
		
		var empList = JSON.parse(empListJson);
		
		// role 값들의 개수를 저장할 객체 생성
		var periodtimeCounts = {};
		var periodtimeCount = 0;
		
		// empList를 순회하며 periodtime 값들의 개수를 증가
		empList.forEach(function (emp) {
			periodtimeCount++;
		  var periodtimeString = convertFieldToString(emp.periodtime);
		  
		  if (periodtimeCounts.hasOwnProperty(periodtimeString)) {
			  periodtimeCounts[periodtimeString]++;
		  } else {
			  periodtimeCounts[periodtimeString] = 1;
		  }
		});
		
		// 필드 값을 문자열로 변환하는 함수
		function convertFieldToString(periodtimeValue) {
		  switch (periodtimeValue) {
		    case '0':
		      return '수료 전';
		    case '1':
		      return '수료 후 1개월 이내';
		    case '2':
		      return '수료 후 1~3개월';
		    case '3':
		      return '수료 후 3~6개월';
		    case '4':
		      return '수료 후 6~12개월';
		    case '5':
		      return '수료 후 1년 이상';
		    case '6': 
		      return '기타';
		    default:
		      return 'Unknown';
		  }
		}
		
		google.charts.load("current", {packages:["corechart"]});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
		  // 새로운 배열을 만들어 roleCounts 객체의 값을 배열로 변환
		  var dataArray = Object.entries(periodtimeCounts);
		
		  // 배열의 첫 번째 열을 추가하여 2차원 배열 형태로 만듦
		  dataArray.unshift(['Periodtime', 'Count']);
		
		  var data = google.visualization.arrayToDataTable(dataArray);
		
		  var options = {
		    title: '수료 후 준비기간 (표본 :' + periodtimeCount + '명)',
		    pieHole: 0.4,
		  };
		
		  var chart = new google.visualization.PieChart(document.getElementById('donutchart7'));
		  chart.draw(data, options);
		}
		
</script>
<script>
		var empListJson = '${empListJson}'; // JSP에서 문자열 그대로 가져옴
		
		var empList = JSON.parse(empListJson);
		
		// education 값들의 개수를 저장할 객체 생성
		var educationCounts = {};
		var educationCount = 0;
		
		// empList를 순회하며 education 값들의 개수를 증가
		empList.forEach(function (emp) {
			educationCount++;
		  var educationString = convertFieldToString(emp.education);
		  
		  if (educationCounts.hasOwnProperty(educationString)) {
			  educationCounts[educationString]++;
		  } else {
			  educationCounts[educationString] = 1;
		  }
		});
		
		// 필드 값을 문자열로 변환하는 함수
		function convertFieldToString(educationValue) {
		  switch (educationValue) {
		    case '0':
		      return '고졸';
		    case '1':
		      return '전문대';
		    case '2':
		      return '대학교(수도권)';
		    case '3':
		      return '대학교(비수도권)';
		    case '4':
		      return '대학원';
		    case '5':
		      return '기타';
		    default:
		      return 'Unknown';
		  }
		}
		
		google.charts.load("current", {packages:["corechart"]});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
		  // 새로운 배열을 만들어 roleCounts 객체의 값을 배열로 변환
		  var dataArray = Object.entries(educationCounts);
		
		  // 배열의 첫 번째 열을 추가하여 2차원 배열 형태로 만듦
		  dataArray.unshift(['ㄸducation', 'Count']);
		
		  var data = google.visualization.arrayToDataTable(dataArray);
		
		  var options = {
		    title: '수료 후 준비기간 (표본 :' + educationCount + '명)',
		    pieHole: 0.4,
		  };
		
		  var chart = new google.visualization.PieChart(document.getElementById('donutchart8'));
		  chart.draw(data, options);
		}
		
</script>
<script>
	
		var empListJson = '${empListJson}'; // JSP에서 문자열 그대로 가져옴
		
	    var empList = JSON.parse(empListJson);
		
	 	// major 값들의 개수를 저장할 객체 생성
	    var majorCounts = {};
		var majorCount=0;
	    // empList를 순회하며 major 값들의 개수를 증가
	    empList.forEach(function (emp) {
	    	majorCount++;
	      if (majorCounts.hasOwnProperty(emp.major)) {
	    	  majorCounts[emp.major]++;
	      } else {
	    	  majorCounts[emp.major] = 1;
	      }
	    });

	 	// careerCounts 객체를 사용하여 값들을 변수에 연결
	    var 전공 = majorCounts['전공'];
	    var 비전공 = majorCounts['비전공'];

	    google.charts.load("current", {packages:["corechart"]});
	    google.charts.setOnLoadCallback(drawChart);

	    function drawChart() {
	        // 새로운 배열을 만들어 comsizeCounts 객체의 값을 배열로 변환
	        var dataArray = Object.entries(careerCounts);

	        // 배열의 첫 번째 열을 추가하여 2차원 배열 형태로 만듦
	        dataArray.unshift(['Major', 'Count']);

	        var data = google.visualization.arrayToDataTable(dataArray);

	        var options = {
	            title: '전공 유무 (표본 :'+majorCount+'명)',
	            pieHole: 0.4,
	        };

	        var chart = new google.visualization.PieChart(document.getElementById('donutchart9'));
	        chart.draw(data, options);
	    }
</script>
<script>
		var empListJson = '${empListJson}'; // JSP에서 문자열 그대로 가져옴
		
		var empList = JSON.parse(empListJson);
		
		// location 값들의 개수를 저장할 객체 생성
		var locationCounts = {};
		var locationCount = 0;
		
		// empList를 순회하며 education 값들의 개수를 증가
		empList.forEach(function (emp) {
			locationCount++;
		  var locationString = convertFieldToString(emp.location);
		  
		  if (locationCounts.hasOwnProperty(locationString)) {
			  locationCounts[locationString]++;
		  } else {
			  locationCounts[locationString] = 1;
		  }
		});
		
		// 필드 값을 문자열로 변환하는 함수
		function convertFieldToString(locationValue) {
		  switch (locationValue) {
		    case '0':
		      return '구로/가산 디지털단지';
		    case '1':
		      return '강남';
		    case '2':
		      return '판교';
		    case '3':
		      return 'DMC(상암)';
		    case '4':
		      return '영등포';
		    case '5':
		      return '시청/종로';
		    case '6':
		      return '기타';
		    default:
		      return 'Unknown';
		  }
		}
		
		google.charts.load("current", {packages:["corechart"]});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
		  // 새로운 배열을 만들어 roleCounts 객체의 값을 배열로 변환
		  var dataArray = Object.entries(locationCounts);
		
		  // 배열의 첫 번째 열을 추가하여 2차원 배열 형태로 만듦
		  dataArray.unshift(['Location', 'Count']);
		
		  var data = google.visualization.arrayToDataTable(dataArray);
		
		  var options = {
		    title: '지역 (표본 :' + locationCount + '명)',
		    pieHole: 0.4,
		  };
		
		  var chart = new google.visualization.PieChart(document.getElementById('donutchart10'));
		  chart.draw(data, options);
		}
</script>
<script type="text/javascript">

google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawChart);

var empListJson = '${empListJson}'; // JSP에서 문자열 그대로 가져옴
var empList = JSON.parse(empListJson);

// certification 값들의 개수를 저장할 객체 생성
var certificationCounts = {};

// empList를 순회하며 certification 값들의 개수를 증가
empList.forEach(function (emp) {
  // emp.certification에서 값을 읽어와서 배열로 만들기
  var certificationArray = emp.certification.split(',').map(Number);

  // 각 값의 개수를 세기
  certificationArray.forEach(function (value) {
    if (certificationCounts.hasOwnProperty(value)) {
      certificationCounts[value]++;
    } else {
      certificationCounts[value] = 1;
    }
  });
});

// 0부터 5까지의 값이 몇개 있는지 변수에 담기
var 없음 = certificationCounts[0] || 0;
var 정필기 = certificationCounts[1] || 0;
var 정실기 = certificationCounts[2] || 0;
var SQLD = certificationCounts[3] || 0;
var AWS = certificationCounts[4] || 0;
var 기타 = certificationCounts[5] || 0;

function drawChart() {
  var data = google.visualization.arrayToDataTable([
    ["Element", "인원 수", { role: "style" } ],
    ["없음", 없음, "#b87333"],
    ["정보처리기사(필기)", 정필기, "silver"],
    ["정보처리기사(실기)", 정실기, "gold"],
    ["SQLD", SQLD, "color: #e5e4e2"],
    ["AWS", AWS, "color: #e5e4e2"],
    ["기타", 기타, "color: #e5e4e2"]
  ]);

  var view = new google.visualization.DataView(data);
  view.setColumns([0, 1,
                   { calc: "stringify",
                     sourceColumn: 1,
                     type: "string",
                     role: "annotation" },
                   2]);

  var options = {
    title: "취업 당시 보유 자격증",
    width: 400,
    height: 300,
    bar: {groupWidth: "95%"},
    legend: { position: "none" },
    annotations: {
        alwaysOutside: true,
        textStyle: {
          fontSize: 12,
          auraColor: 'none',
          color: '#000',
          bold: true,
          italic: false,
          slantedText: false,
        }
      },
  };
  var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
  chart.draw(view, options);
}
</script>



