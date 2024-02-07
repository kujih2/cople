(function(){
    $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
        googleCalendarApiKey: '',// 여기에 구글캘린더 api키 입력하시면 됩니다.
        height: '700px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        customButtons:{
          myCustomButton:{
            text:"일정추가",
            click : function(){
                  //부트스트랩 모달 열기
                  $("#exampleModal").modal("show");              
            }
          },
          mySaveButton:{
            text:"저장",
            click: async function () {
              if (confirm("저장하시겠습니까?")) {
                //지금까지 생성된 모든 이벤트 저장하기
                var allEvent = calendar.getEvents();
                console.log("모든 이벤트들", allEvent);
                //이벤트 저장하기
                const saveEvent = await axios({
                  method: "POST",
                  url: "/calendar",
                  data: allEvent,
                });
              }
            },
          }
        },
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today,myCustomButton,mySaveButton',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        // initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },
        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
          var title = prompt('Event Title:');
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay
            })
          }
          calendar.unselect()
        },
        //데이터 가져오는 이벤트
        eventSources:[
          {
            events: async function (info, successCallback, failureCallback) {
          const eventResult = await axios({
            method: "POST",
            url: "/eventData",
          });
          const eventData = eventResult.data;
          //이벤트에 넣을 배열 선언하기
          const eventArray = [];
          eventData.forEach((res) => {
            eventArray.push({
              title: res.title,
              start: res.start,
              end: res.end,
              backgroundColor: res.backgroundColor,
            });
          });
          successCallback(eventArray);
        
        },
          },
            {
              googleCalendarId : 'ko.south_korea.official#holiday@group.v.calendar.google.com',
              backgroundColor: 'red',
            }
        ]
      });

      //모달창 이벤트
      $("#saveChanges").on("click", function () {
            var eventData = {
              title: $("#title").val(),
              start: $("#start").val(),
              end: $("#end").val(),
              color: $("#color").val(),
            };
            //빈값입력시 오류
            if (
              eventData.title == "" ||
              eventData.start == "" ||
              eventData.end == ""
            ) {
              alert("입력하지 않은 값이 있습니다.");

              //끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
            } else if ($("#start").val() > $("#end").val()) {
              alert("시간을 잘못입력 하셨습니다.");
            } else {
              // 이벤트 추가
              calendar.addEvent(eventData);
              $("#exampleModal").modal("hide");
              $("#title").val("");
              $("#start").val("");
              $("#end").val("");
              $("#color").val("");
            }
          });
      // 캘린더 랜더링
      calendar.render();
    });
  })();