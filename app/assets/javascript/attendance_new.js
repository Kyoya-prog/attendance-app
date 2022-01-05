const item = document.getElementById('clock');


function time() {
    let today = new Date();
    console.log(today.toLocaleString("ja"));
    console.log(item)
    item.innerHTML = today.toLocaleString("ja");
    window.requestAnimationFrame(time);
};

console.log("hogehoge")

time();