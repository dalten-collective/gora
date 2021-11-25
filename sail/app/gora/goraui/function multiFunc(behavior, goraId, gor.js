function multiFunc(behavior, goraId, goraName, host, remaining){
    var mult = document.getElementById("multi-modal");
    var head = document.getElementById("multi-header");
    var body = document.getElementById("multi-body");
    var foot = document.getElementById("multi-footer");
    head.innerHTML = "";
    body.innerHTML = "";
    foot.innerHTML = "";
    mult.style.display = "block";
    let form = document.createElement("form");
    let bra  = document.createElement("br");

    // Create title
      let title = document.createElement("p");
        title.className = "gora-color";
      
  if (behavior == "transfer") {
      title.innerText = `Forward ${goraName}`;
      
      // Create form
      var id = document.createElement("input");
        id.type = "text";
        id.name = "gora-id"
        id.value = goraId;
        id.style.display = "none";
        id.style.width = id.value.length + "ch";
        id.style.align = "center";

      var butn = document.createElement("button");
        butn.type = "submit";
        butn.name = "action";
        butn.value = "transfer"
        butn.className = "wuttarButton";
        butn.innerText = "Submit";

        form.className = "multi-form";
        form.method = "POST";
        form.appendChild(id);
        for (var i = 0; i < Math.min(parseInt(remaining), 5); i++) {
          form.appendChild(document.createElement("br"));
          var ship = document.createElement("input");
          ship.type="text";
          ship.placeholder = "~sampel-palnet";
          ship.id=`ship-${i}`;
          ship.name=`ship-${i}`;
          form.appendChild(ship);
        };
        form.appendChild(document.createElement("br"));
        form.appendChild(butn);
    } else if (behavior == "reissue") {
        console.log("reissue");
    } else if (behavior == "mkgora") {
      title.innerText = `Make a %gora`

      var namLab = document.createElement("label");
        namLab.for = "nam";
        namLab.innerText = "Name: ";
        namLab.className = "gora-color";
      var nam = document.createElement("input");
        nam.type = "text";
        nam.name = "name";
        nam.id   = "nam";
        nam.style.width = "85%";
        nam.style.align = "center";
      
      var imagLab = document.createElement("label");
        imagLab.for = "img";
        imagLab.innerText = "Img. URL: ";
        imagLab.className = "gora-color";
      var imag = document.createElement("input");
        imag.type = "url";
        imag.name = "gora-img";
        imag.id   = "img";
        imag.style.width = "80%";
        imag.style.algin = "center";
      
      var pubLab = document.createElement("span")
        pubLab.className = "gora-color";
        pubLab.innerText = "Public:"
      var pYLab = document.createElement("label");
        pYLab.for = "pubYus";
        pYLab.innerText = "%.y";
        pYLab.className = "gora-color";
      var pubYus = document.createElement("input");
        pubYus.type = "radio";
        pubYus.name = "public";
        pubYus.id   = "pubYus"
        pubYus.value = "%.y";
      
      var pNLab = document.createElement("label");
        pNLab.for = "pubNo";
        pNLab.innerText = "%.n";
        pNLab.className = "gora-color";
      var pubNo = document.createElement("input");
        pubNo.type = "radio";
        pubNo.name = "public";
        pubNo.id   = "pubNo";
        pubYus.value = "%.n";

      var maxLab = document.createElement("label");
        maxLab.for = "maxUse";
        maxLab.innerText = "Max Hodlers (0 for Unlimited): ";
        maxLab.className = "gora-color";
      var maxUsers = document.createElement("input");
        maxUsers.type = "number";
        maxUsers.id = "maxUse";
        maxUsers.name = "maxUsers"
        maxUsers.min = "0";
        maxUsers.placeholder = "0";
        maxUsers.style.width = "40%";
      
      var reqLab = document.createElement("label");
        reqLab.for = "reqBehave";
        reqLab.innerText = "Request Behavior: ";
        reqLab.className = "gora-color";
      var reqBehave = document.createElement("select");
        reqBehave.id = "reqBehave";
        reqBehave.name = "requestBehavior";
        reqBehave.style.width = "40%"
        var behav1 = document.createElement("option");
          behav1.value = "approve";
          behav1.text = "%approve";
          reqBehave.appendChild(behav1);
        var behav2 = document.createElement("option");
          behav2.value = "reject";
          behav2.text = "%reject";
          reqBehave.appendChild(behav2);
        var behav3 = document.createElement("option");
          behav3.value = "none";
          behav3.text = "%none";
          behav3.selected = true;
          reqBehave.appendChild(behav3);
      
      var givLab = document.createElement("label");
        givLab.for = "givBehave";
        givLab.innerText = "Give Behavior: ";
        givLab.className = "gora-color";
      var givBehave = document.createElement("select");
        givBehave.id = "givBehave";
        givBehave.name = "giveBehavior";
        givBehave.setAttribute = ("onchange",)
        givBehave.style.width = "40%"
        var behav1 = document.createElement("option");
          behav1.value = "transfer";
          behav1.text = "%transfer";
          givBehave.appendChild(behav1);
        var behav2 = document.createElement("option");
          behav2.value = "reissue";
          behav2.text = "%reissue";
          givBehave.appendChild(behav2);
        var behav3 = document.createElement("option");
          behav3.value = "none";
          behav3.text = "%none";
          behav3.selected = true;
          givBehave.appendChild(behav3);
      
      var butn = document.createElement("button");
        butn.type = "submit";
        butn.name = "action";
        butn.value = "mkgora";
        butn.className = "wuttarButton";
        butn.innerText = "Submit";
      
      form.className = "multi-form";
      form.method = "POST";
      form.appendChild(namLab);
      form.appendChild(nam);
      form.appendChild(document.createElement("br"));
      form.appendChild(imagLab)
      form.appendChild(imag);
      form.appendChild(document.createElement("br"));
      form.appendChild(pubLab);
      form.appendChild(pYLab);
      form.appendChild(pubYus);
      form.appendChild(pNLab);
      form.appendChild(pubNo);
      form.appendChild(document.createElement("br"));
      form.appendChild(maxLab);
      form.appendChild(maxUsers);
      form.appendChild(document.createElement("br"));
      form.appendChild(reqLab);
      form.appendChild(reqBehave);
      form.appendChild(document.createElement("br"));
      form.appendChild(givLab);
      form.appendChild(givBehave);
      form.appendChild(document.createElement("br"));
      form.appendChild(butn);

    } else if (behavior == "send-request") {
      title.innerText = `Request %gora`;
      
      // Create form
      var id = document.createElement("input");
        id.type = "text";
        id.name = "gora-id"
        id.style.width = "40ch";
        id.style.align = "center";
      
      var host = document.createElement("input");
        host.type = "text";
        host.placeholder = "~sampel-palnet";
        host.id = "host"
        host.name = "host"

      var butn = document.createElement("button");
        butn.type = "submit";
        butn.name = "action";
        butn.value = "send-request"
        butn.className = "wuttarButton";
        butn.innerText = "Submit";

        form.className = "multi-form";
        form.method = "POST";
        form.appendChild(id);
        form.appendChild(document.createElement("br"));
        form.appendChild(host);
        form.appendChild(document.createElement("br"));
        form.appendChild(butn);
    };
      head.appendChild(title);
      body.appendChild(form);
  };

function Transfer() {
  var givHav = document.getElementById("givBehave");
  var selected = givHav.options[givHav.selectedIndex].value;
  if (selected == "transfer") {
    var reqHav = document.getElementById("reqBehave");
    reqHav.selectedIndex = 3;
    var maxUse = document.getElementById("maxUse");
    maxUse.value = 0
  };
}

function multiClose() {
  var mult = document.getElementById("multi-modal");
  var head = document.getElementById("multi-header");
  var body = document.getElementById("multi-body");
  var foot = document.getElementById("multi-footer");
  mult.style.display = "none";
  head.innerHTML = "";
  body.innerHTML = "";
  foot.innerHTML = "";
}

function goraImgBtn(modalId) {
var goraModal;
  goraModal = document.getElementById(modalId);
  goraModal.style.display = "block";
};

var modalAll = document.getElementsByClassName("modal");

window.onclick = function(event) {
  for (var i = 0; i < modalAll.length; i++) {
    if (event.target == modalAll.item(i)) {
      modalAll.item(i).style.display = "none";
    };
  };
};