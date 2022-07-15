var islogin = false;
let login = document.getElementById("login");
login.onclick = function () {
  if (islogin) {
    window.location.href = "../pet_login.html";
  } else {
    window.location.href = "../pet_info.html";
  }
};
