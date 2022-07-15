// 详情大小图的切换
const imgs = document.querySelectorAll(".img_small>img");
imgs.forEach((img) => {
  img.onclick = function () {
    document.querySelector(".img_small>.active").classList.remove("active");
    this.classList.add("active");

    const { id } = this.dataset;
    console.log(id);
    const big_img = document.querySelector(".img_big>img");
    big_img.src = "./img/" + id;
  };
});
//猜你喜欢轮播商品列表
// transform控制列表
const left = document.getElementById("like_left");
const list1 = document.getElementById("list1");
const right = document.getElementById("like_right");
const list2 = document.getElementById("list2");
const list3 = document.getElementById("list3");
const wrap = document.getElementById("wrap");
// var translateX = 0;
// left.addEventListener("click", function () {
//   // console.log("第三次");
//   translateX = translateX + 960;
//   if (translateX > 0) {
//     translateX = -1920;
//   }
//   console.log(translateX + "左键");
//   list1.style.transform = `translateX(${translateX}px)`;
//   list1.style.transition = "all 1s";
//   list2.style.transform = `translateX(${translateX}px)`;
//   list2.style.transition = "all 1s";
//   list3.style.transform = `translateX(${translateX}px)`;
//   list3.style.transition = "all 1s";
// });
// right.addEventListener("click", function () {
//   if (translateX <= -1920) {
//     translateX = 960;
//   }
//   translateX = translateX - 960;
//   list1.style.transform = `translateX(${translateX}px)`;
//   list1.style.transition = "all 1s";
//   list2.style.transform = `translateX(${translateX}px)`;
//   list2.style.transition = "all 1s";
//   list3.style.transform = `translateX(${translateX}px)`;
//   list3.style.transition = "all 1s";
//   console.log(translateX + "右键");
// });
//控制外部的盒子
list1.style.left = "0px";

var nowleft = 0;
left.addEventListener("click", function () {
  if (nowleft == 0) {
    nowleft = -2880;
  }
  nowleft = nowleft + 960;
  list1.style.left = nowleft + "px";
  list1.style.transition = "all 1s";
  console.log(nowleft);
});
right.addEventListener("click", function () {
  if (nowleft <= -1920) {
    nowleft = 960;
  }
  nowleft = nowleft - 960;
  list1.style.left = nowleft + "px";
  list1.style.transition = "all 1s";
  console.log("右击", nowleft);
});
// 切换TAB栏
const assess = document.querySelectorAll(".assess_title>ul>li");
assess.forEach((tab) => {
  tab.onclick = function () {
    console.log("111");
    document
      .querySelector(".assess_title>ul>.active")
      .classList.remove("active");
    this.classList.add("active");

    const { id } = this.dataset;
    document.querySelector(".d_con .show").classList.remove("show");
    document.getElementById(id).classList.add("show");
  };
});
