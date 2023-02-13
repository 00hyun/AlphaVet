<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
$(function(){
	const goodSentances = [
	     "동물에게 잔인한 사람은 사람을 대할 때도 마찬가지다.<br>사람의 마음은 동물을 대할 때의 태도로 알 수 있다.",
	     "한나라의 위대함과 도덕성은 동물을 대하는 태도로 알 수 있다.",
	     "삶은 말하지 못하는 생명체에게도 소중한 것이다.<br>사람이 행복을 원하고 고통을 두려워하며 생명을 원하는 것처럼, 그들 역시 그러하다.",
	     "인간에게 동물을 다스릴 권리가 있는것이 아니라 모든 동물을 지킬 의무가 있다.",
	     "자유는 말못하는 동물도 지니고 있다.",
	     "나는 반려동물이 우리의 삶에서 어떤 의미를 지니는지 알게 되었다.<br>반려동물을 키우며 우리는 조건 없는 사랑을 배운다"
	   ];

	   const goodSentance = document.querySelector("#goodSentance span:first-child");

	   const todayGoodSentance = goodSentances[Math.floor(Math.random() * goodSentances.length)];
	   
	   goodSentance.innerHTML = todayGoodSentance;
	
	})

	
	
</script>




<div style="text-align: center; height: 20px" id="goodSentance">
	<h4 id="good">
		<a>"</a><b><span></span></b><a>"</a>
	</h4>
</div>