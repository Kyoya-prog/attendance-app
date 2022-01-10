const item = document.getElementById('clock');


function time() {
    let today = new Date();
    item.innerHTML = today.toLocaleString("ja");
    window.requestAnimationFrame(time);
};

time();