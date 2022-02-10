// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require activestorage
//= require_tree .

$(document).ready(function(){
    randColor = Math.floor(Math.random()*16777215).toString(16);
    $('.circle').css('background-color', '#'+randColor)
    console.log(randColor)
    console.log('helloooo')

    function addLikeToPost(){

    }

    function removeLikeFromPost(){

    }

    $('.like').on('click', function(){
        console.log($(this))
        $(this).val('❤️')
        console.log('clicked')
        $(this).removeClass('likebtn like')
        $(this).addClass('likebtn liked')
        addLikeToPost()
    })
    $('.liked').on('click', function(){
        $(this).val('🤍')
        console.log('clicked')
        $(this).removeClass('likebtn liked')
        $(this).addClass('likebtn like')
        removeLikeFromPost()
    })
});
