if (location.pathname.match( "gears" )){
if (document.URL.match(　/new/　)){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("maker_name");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("maker_name").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search_result");
        searchResult.innerHTML = "";

          if (XHR.response) {
          const makerName = XHR.response.keyword;
          makerName.forEach((maker) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", maker.id);
            childElement.innerHTML = maker.maker_name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(maker.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("maker_name").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    });
  });
};
if (document.URL.match( /edit/ )){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("maker_name");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("maker_name").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `edit_search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search_result");
        searchResult.innerHTML = "";

          if (XHR.response) {
          const makerName = XHR.response.keyword;
          makerName.forEach((maker) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", maker.id);
            childElement.innerHTML = maker.maker_name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(maker.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("maker_name").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    });
  });
};
};