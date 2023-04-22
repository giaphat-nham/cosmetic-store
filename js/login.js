function loginform() {
    document.getElementById("register_overlay").style.display='none';
    document.getElementById("login_overlay").style.display='flex';
}

function registerform() {
    document.getElementById("login_overlay").style.display='none';
    document.getElementById("register_overlay").style.display='flex';
}

function close_form() {
    document.getElementById("register_overlay").style.display='none';
    document.getElementById("login_overlay").style.display='none';
}

function Signined(){
    document.getElementById('post-login').style.display='flex';
    document.getElementById('btn-user').style.display='none';
}