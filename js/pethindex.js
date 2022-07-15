//定义一个下标
var index = 0;
// 时间间隔
var time = 5000;
//获取所用到元素的id
var line = document.getElementById("line");
var icon00 = document.getElementById("pet_icon1");
var icon01 = document.getElementById("pet_icon2");
var icon02 = document.getElementById("pet_icon3");
var icon03 = document.getElementById("pet_icon4");
var obj = document.getElementById("pet_center");
var pet_title = document.getElementById("pet_title");
// // 获取当前屏幕的宽度
// var Screenwidth = document.body.clientWidth;
// console.log(Screenwidth);
//定义一个变量  接受线的当前值
var linewidth = line.clientWidth;
//定义一个存放图片的数组
var arr = new Array("keji05.jpg", "keji06.jpg", "keji07.jpg", "keji08.jpg");
var title_arr = new Array(
  "您或许会有很多个它,<br>但它只有一个您",
  "平凡的日子因你而精彩",
  "汪，便宜你了",
  "爱它从这里开始"
);
// 获取点击元素到屏幕左部分的距离  +13:计算到元素中心点
var icon00_left = icon00.offsetLeft + 13;
var icon01_left = icon01.offsetLeft + 13;
var icon02_left = icon02.offsetLeft + 13;
var icon03_left = icon03.offsetLeft + 13;
var iconarr = new Array(icon00_left, icon01_left, icon02_left, icon03_left);
// 封装一个函数 实现点击事件  ，事件的变化
// 点击事件与定时器事件会产生冲突，待解决
function toclick(iconi, i, pos) {
  // 实现标题内容的改变
  pet_title.innerHTML = title_arr[i];
  //实现标题位置的改变
  pet_title.style.left = pos;
  // 标题位置 改变时的过渡动画
  pet_title.style.transition = "all 4s ease-out";
  // 实现 线长度的变化
  line.style.width = iconi + "px";
  // 线长度变化的过渡
  line.style.transition = "all 4s ease-out";
  // 背景图片的变化
  obj.style.backgroundImage = arr[i];
  // 背景图片的过渡
  obj.style.transition = "background 1s 0.5s ease-out";
  // linewidth = iconi;
  console.log(linewidth);
}
icon00.onclick = function () {
  toclick(icon00_left, 0, "5%");
};
icon01.onclick = function () {
  toclick(icon01_left, 1, "15%");
};
icon02.onclick = function () {
  toclick(icon02_left, 2, "35%");
};
icon03.onclick = function () {
  toclick(icon03_left, 3, "55%");
};
setInterval(Imgchange, time);
function Imgchange() {
  if (index == arr.length - 1) {
    index = 0;
  } else {
    index += 1;
  }
  // 定时器触发的事件
  obj.style.backgroundImage = "url(../img/" + arr[index] + ")";
  obj.style.transition = "background 1s 0.5s ease-out";
  line.style.width = iconarr[index] + "px";
  line.style.transition = "all 4s ease-out";
  pet_title.innerHTML = title_arr[index];
  pet_title.style.transition = "all 4s ease-out";
  // 通过判断实现在不同位置，标题位置的改变
  if (line.clientWidth == icon00_left) {
    pet_title.style.left = "15%";
  } else if (line.clientWidth == icon01_left) {
    pet_title.style.left = "35%";
  } else if (line.clientWidth == icon02_left) {
    pet_title.style.left = "55%";
  } else {
    pet_title.style.left = "5%";
  }
}
const titles = document.querySelectorAll(".info_headline>span");
titles.forEach((title) => {
  title.onclick = function () {
    document.querySelector(".info_headline .active").classList.remove("active");
    this.classList.add("active");

    document.querySelector(".pet_information .show").classList.remove("show");

    const { id } = this.dataset;
    console.log(id);

    document.getElementById(id).classList.add("show");
  };
});
const lists = document.querySelectorAll(".info_content_list>ul>li");
lists.forEach((list) => {
  list.onmouseover = function () {
    document
      .querySelector(".info_content_list .active")
      .classList.remove("active");
    this.classList.add("active");
    const { id } = this.dataset;
    console.log(id);
    const imgurl = "../img/" + id;
    console.log(imgurl);
    const img = document.getElementById("info_content_img");
    img.style.background = "url(" + imgurl + ") no-repeat center";
    img.style.backgroundSize = "cover";
    console.log();
  };
});
