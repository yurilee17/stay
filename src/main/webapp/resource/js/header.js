document.addEventListener("DOMContentLoaded", function() {
	moreBt()

})

function moreBt() {
	let more = document.getElementById("more");
	let moreList = document.querySelector(".list_03");


	more.addEventListener("mouseover", function() {
		moreList.style.display = "block";
	});
	
	moreList.addEventListener("mouseover", function() {
		moreList.style.display = "block";
	});


	moreList.addEventListener("mouseout", function() {
		moreList.style.display = "none";
	});


	more.addEventListener("mouseout", function() {
		moreList.style.display = "none";
	});
}