$(document).ready(function(){
  $('.new_review').on('submit', function(event){
    event.preventDefault();
    // var ulParent =  $(this).parent().find('ul');
    var ulParent =  $(this).siblings('ul');
    console.log(ulParent);
    
    $.post($(this).attr('action'), $(this).serialize(),function(response){
      var template = $('#review_template').html();
      var rendered = Mustache.render(template,response);
      ulParent.append(rendered);
    }, 'json');
  })
})