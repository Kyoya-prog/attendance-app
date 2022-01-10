const item = document.getElementById('clock');

const date = document.getElementById("current_date")


function time() {
    let today = new Date();
    item.innerHTML = today.toLocaleString("ja");
    window.requestAnimationFrame(time);
};

function setDate() {
    let date = new Date();
    let year = date.getFullYear();
    let month = date.getMonth() + 1;
    let day = date.getDate()
    date.innerHTML = `今日は${month}月${day}日です`;
}

time();

setDate();

