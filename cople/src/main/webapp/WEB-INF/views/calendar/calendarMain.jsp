<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<form class="divide-y divide-gray-500/30 dark:divide-gray-500/70 lg:col-span-9">
	<div class="my-10 lg:my-0 lg:pl-20">
		<h2 class="text-xl font-semibold leading-6">캘린더</h2>
		<div class="my-10 flex flex-col lg:flex-row">
			<div class="flex-grow space-y-6"><div>
    			  <div id='calendar-container'>
    <div id='calendar'></div>
  </div>
      <!-- 부트스트랩 modal 부분 -->
    <!-- Modal -->
    <div
      class="modal fade"
      id="exampleModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">일정 추가하기</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            일정이름 : <input type="text" id="title" /><br />
            시작시간 : <input type="datetime-local" id="start" /><br />
            종료시간 : <input type="datetime-local" id="end" /><br />
            배경색상 :
            <select id="color">
              <option value="red">빨강색</option>
              <option value="orange">주황색</option>
              <option value="yellow">노랑색</option>
              <option value="green">초록색</option>
              <option value="blue">파랑색</option>
              <option value="indigo">남색</option>
              <option value="purple">보라색</option>
            </select>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              취소
            </button>
            <button type="button" class="btn btn-primary" id="saveChanges">
              추가
            </button>
          </div>
        </div>
      </div>
    </div>
			</div>
		
		</div>
	</div>
	</div>
</form>
