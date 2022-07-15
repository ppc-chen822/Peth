let pet_body = document.querySelector(".pet_body");
// 给它添加一个 “wheel” 事件，这个是监听鼠标滚轮的滚动，在滚动时，先阻止默认的滚动事件，然后让容器水平横向移动，这里利用到了 scrollLeft 属性，让容器的内容向左移动，这里只需要加上滚轮垂直滚动的距离差值就可以了，也就是 event 对象中的 deltaY 属性：
pet_body.addEventListener("wheel", (event) => {
  event.preventDefault();
  pet_body.scrollLeft += event.deltaY;
});
