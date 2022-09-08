

$(document).ready(function(){

    $('#card-rewards').css('display','none');

    window.addEventListener( 'message', function( event ) {

        if (event.data.action == 'showInterface') {
            $('#card-rewards').css('display','flex');
            var premios = event.data.regalos
            if (premios > 1) {
                $('#card-regalos-total').text(premios)
            } else {
                $('#card-regalos-total').text(premios)
            }
        }

        if (event.data.action == 'showWinner') {
           showWinner(event.data.itemName)
        }
       
    });
        
    $(document).keyup(function(e) {
        if ( e.keyCode == 27 || e.keyCode == 8 ) {
            closeAll() 
        }
    });

    $("#have-gift").on("mouseup", function() {
        $("#have-gift").hide()
        $("#card-rewards").show()
    });

    $("#nope").on("mouseup", function() {
        closeAll()
    });

    $("#claim").on("mouseup", function() {
        $("#have-gift").hide()
        $("#card-rewards").show()
        $.post('http://xex_rewards/openReward', JSON.stringify({}));
    });

    $("#final").on("mouseup", function() {
        closeAll()
    });
})

function showWinner(winner) {
    $("#placeholder-content").hide()
    $("#placeholder-buttons").hide()
    $("#placeholder-reward").hide()
    
    $("#"+winner).show()
    // $("#"+winner+"-img").show()
    $("#item-img").attr("src",'assets/' + winner + '.png');
    $("#item-img").css('display','block');
    $("#final").show()
    
}

function closeAll() {
    $("#card-rewards").hide()
    $.post('http://xex_rewards/closeButton', JSON.stringify({}));

    $("#final").hide()
    $("#car").hide()
    $("#black_money").hide()
    $("#money").hide()
    $("#final-img").hide()
    $("#item-img").hide()


    $("#placeholder-content").show()
    $("#placeholder-buttons").show()
    $("#placeholder-reward").show()
}

