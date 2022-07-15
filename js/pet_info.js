const list = document.querySelectorAll(".list>li");
list.forEach((item) => {
  console.log(item);
  item.onclick = function () {
    console.log("1");
    document.querySelector(".list>.active").classList.remove("active");
    this.classList.add("active");
  };
});
const tabs = document.getElementById("message");
console.log(tabs);
const items = tabs.content.querySelectorAll(".message_tab>ul>li");
console.log(items);
items.forEach((tab) => {
  console.log(tab);
  tab.onclick = function () {
    console.log("11");
    document.querySelector(".message_tab>.active").classList.remove("active");
    this.classList.add("active");
  };
});
