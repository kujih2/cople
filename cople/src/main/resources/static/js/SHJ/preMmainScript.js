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
