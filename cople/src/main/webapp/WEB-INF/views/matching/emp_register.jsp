<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<style>
.marquee {
            white-space: nowrap;
            overflow: hidden;
            position: absolute;
            top: 50%;
            right: 100%;
            animation: marqueeAnimation 10s linear infinite; /* 애니메이션 속성 설정 */
        }
@keyframes marqueeAnimation {
            to {
                right: 100%; /* 오른쪽에서 왼쪽으로 이동하는 효과를 위해 right 속성 사용 */
            }
        }
 body {
            overflow: hidden;
        }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    select {
        padding: 6px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

</style>
<script>

	function closePopup(){
		window.close();
	}
</script>
<h2>현직자 신청 양식</h2>
<div class="marquee">
        <p>님의 취업을 진심으로 축하드립니다!</p>
    </div>
<form action="empInsert" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<c:if test="${!user.nick_name}">
				<td colspan="5">${user.id}</td>
			</c:if>
			<c:if test="${user.nick_name}">
				<td colspan="5">${user.nick_name}</td>
			</c:if>
		</tr>
		<tr>
			<td>이름</td>
			<td colspan="5">${user.name}</td>
		</tr>
		<tr>
			<td><label for="comsize">회사규모</label>
			<br>
				<select id="comsize" name="comsize_status">
					<option value="0">공개</option>
					<option value="1">비공개</option>
				</select>
			</td>
			<td colspan="5">
				<input type="radio" id="comsize" name="comsize" value="스타트업">스타트업
				<input type="radio" id="comsize" name="comsize" value="중소">중소
				<input type="radio" id="comsize" name="comsize" value="중견">중견
				<input type="radio" id="comsize" name="comsize" value="대기업">대기업
			</td>
		</tr>
		<tr>
			<td><label for="compeople_status">기업인력규모</label>
			<br>
				<select id="compeople_status" name="compeople_status">
					<option value="0">공개</option>
					<option value="1">비공개</option>
				</select>
			</td>
			<td colspan="5">
				<input type="radio" id="compeople" name="comple" value="0">5~10인
				<input type="radio" id="compeople" name="comple" value="1">10~30인
				<input type="radio" id="compeople" name="comple" value="2">30~50인
				<input type="radio" id="compeople" name="comple" value="3">50~100인
				<input type="radio" id="compeople" name="comple" value="4">100인 이상
			</td>
		</tr>
		<tr>
			<td><label for="field_status">지원분야</label>
			<br>
				<select id="field_status" name="field_status">
					<option value="0">공개</option>
					<option value="1">비공개</option>
				</select>
			</td>
			<td colspan="5">
				<input type="radio" id="field" name="field" value="0">SI
				<input type="radio" id="field" name="field" value="1">SM
				<input type="radio" id="field" name="field" value="2">솔루션
				<input type="radio" id="field" name="field" value="3">서비스
				<input type="radio" id="field" name="field" value="4">기타
				<input type="radio" id="field" name="field" value="5">기타(非IT)
			</td>
		</tr>
		<tr>
			<td><label for="role_status">직무</label>
			<br>
				<select id="role_status" name="role_status">
					<option value="0">공개</option>
					<option value="1">비공개</option>
				</select>
			</td>
			<td colspan="5">
				<input type="radio" id="role" name="role" value="0">백엔드
				<input type="radio" id="role" name="role" value="1">프론트엔드
				<input type="radio" id="role" name="role" value="2">풀스택
				<input type="radio" id="role" name="role" value="3">데브옵스
				<input type="radio" id="role" name="role" value="4">임베디드
				<input type="radio" id="role" name="role" value="5">DBA
				<input type="radio" id="role" name="role" value="6">기타
			</td>
		</tr>
		<tr>
			<td><label for="career_status">지원형태</label>
			<br>
				<select id="career_status" name="career_status">
					<option value="0">공개</option>
					<option value="1">비공개</option>
				</select>
			</td>
			<td colspan="5">
				<input type="radio" id="career" name="career" value="신입">신입
				<input type="radio" id="career" name="career" value="중고신입">중고신입
				<input type="radio" id="career" name="career" value="기타">기타
			</td>
		</tr>
		<tr>
			<td><label for="salary_status">연봉</label>
			<br>
				<select id="salary_status" name="salary_status">
					<option value="0">공개</option>
					<option value="1">비공개</option>
				</select>
			</td>
			<td colspan="5">
				<input type="radio" id="salary" name="salary" value="0">~2,600만원
				<input type="radio" id="salary" name="salary" value="1">2,600~3,000만원
				<input type="radio" id="salary" name="salary" value="2">3,000~3,400만원
				<input type="radio" id="salary" name="salary" value="3">3,400~3,800만원
				<input type="radio" id="salary" name="salary" value="4">3,800~4,200만원
				<input type="radio" id="salary" name="salary" value="5">4,200만원~
			</td>
		</tr>
		<tr>
			<td><label for="periodtime_status">수료 후 준비기간</label>
			<br>
				<select id="periodtime_status" name="periodtime_status">
					<option value="0">공개</option>
					<option value="1">비공개</option>
				</select>
			</td>
			<td colspan="5">
				<input type="radio" id="periodtime" name="periodtime" value="0">수료 전
				<input type="radio" id="periodtime" name="periodtime" value="1">수료 후 1개월 이내
				<input type="radio" id="periodtime" name="periodtime" value="2">수료 후 1개월~3개월
				<input type="radio" id="periodtime" name="periodtime" value="3">수료 후 3개월~6개월
				<input type="radio" id="periodtime" name="periodtime" value="4">수료 후 6개월~1년
				<input type="radio" id="periodtime" name="periodtime" value="5">수료 후 1년~
			</td>
		</tr>
		<tr>
			<td><label for="edcation_status">학력</label>
			<br>
				<select id="edcation_status" name="edcation_status">
					<option value="0">공개</option>
					<option value="1">비공개</option>
				</select>
			</td>
			<td colspan="5">
				<input type="radio" id="education" name="education" value="0">~고졸
				<input type="radio" id="education" name="education" value="1">전문대졸
				<input type="radio" id="education" name="education" value="2">대학교졸(수도권) *졸업예정포함
				<input type="radio" id="education" name="education" value="3">대학교졸(비수도권)
				<input type="radio" id="education" name="education" value="4">대학원
				<input type="radio" id="education" name="education" value="5">기타
			</td>
		</tr>
		<tr>
			<td><label for="major_status">전공 유무</label>
			<br>
				<select id="major_status" name="major_status">
					<option value="0">공개</option>
					<option value="1">비공개</option>
				</select>
			</td>
			<td colspan="5">
				<input type="radio" id="major" name="major" value="전공">전공
				<input type="radio" id="major" name="major" value="비전공">비전공
			</td>
		</tr>
		<tr>
			<td><label for="certification_status">취업 당시 보유 자격증</label>
			<br>
				<select id="certification_status" name="certification_status">
					<option value="0">공개</option>
					<option value="1">비공개</option>
				</select>
			</td>
			<td colspan="5">
				<input type="radio" id="certification" name="certification" value="0">없음
				<input type="radio" id="certification" name="certification" value="0">정보처리기사
				<input type="radio" id="certification" name="certification" value="0">SQLD
				<input type="radio" id="certification" name="certification" value="0">기타
			</td>
		</tr>
		<tr>
			<td><label for="location_status">취업회사 지역</label>
			<br>
				<select id="location_status" name="location_status">
					<option value="0">공개</option>
					<option value="1">비공개</option>
				</select>
			</td>
			<td colspan="5">
				<input type="radio" id="location" name="location" value="0">구로/가산 디지털단지
				<input type="radio" id="location" name="location" value="1">강남
				<input type="radio" id="location" name="location" value="2">판교
				<input type="radio" id="location" name="location" value="3">DMC(상암)
				<input type="radio" id="location" name="location" value="4">영등포
				<input type="radio" id="location" name="location" value="5">시청,종로
				<input type="radio" id="location" name="location" value="6">기타
			</td>
		</tr>
		<tr>
			<td><label for="workstart_status">취업일시</label>
			<br>
				<select id="workstart_status" name="workstart_status">
					<option value="0">공개</option>
					<option value="1">비공개</option>
				</select>
			<br>
			</td>
			<td colspan="5">
				<input type="date" id="workstart" name="workstart" value="취업일시">
			</td>
		</tr>
		<tr>
			<td><label for="filename">합격인증</label>
			<br>
			</td>
			<td colspan="5">
				최종합격 문자/메일 혹은 명함을 첨부해주세요!
				<input type="file" id="filename" name="filename">
			</td>
		</tr>
		<tr>
			<td><label for="advice">후배 쌍용인들에게 조언 한 마디!</label>
			</td>
			<td colspan="5">
				<textarea cols="50" rows="5"></textarea>
			</td>
		</tr>
		
	</table>
		<div class="submit">
			<input type="submit" value="제출">
			<input type="button" value="취소" onclick="closePopup()">
		</div>
</form>
