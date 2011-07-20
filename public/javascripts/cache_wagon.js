function time_ago_in_words(from_time, include_seconds) {
  if (typeof include_seconds == "undefined"){
    include_seconds = false;
  }

  return distance_of_time_in_words(from_time, new Date(), include_seconds);
}

function distance_of_time_in_words(from_time, to_time, include_seconds) {
  if (typeof to_time == "undefined"){
    to_time = new Date();
  }
  if (typeof include_seconds == "undefined"){
    to_time = false;
  }

  var distance_in_milliseconds = to_time.getTime() - from_time.getTime();
  var distance_in_seconds = Math.round(distance_in_milliseconds / 1000);
  var distance_in_minutes = Math.round(distance_in_seconds / 60);

  if (distance_in_minutes <= 1 ) {
    if (include_seconds) {
      if (distance_in_seconds <= 4) {
        return I18n.t('less_than_x_seconds', {scope: ['datetime','distance_in_words'], count: 5});
      } else if (distance_in_seconds <= 9) {
        return I18n.t('less_than_x_seconds', {scope: ['datetime','distance_in_words'], count: 10});
      } else if (distance_in_seconds <= 19) {
        return I18n.t('less_than_x_seconds', {scope: ['datetime','distance_in_words'], count: 20});
      } else if (distance_in_seconds <= 39) {
        return I18n.t('half_a_minute', {scope: ['datetime','distance_in_words']});
      } else if (distance_in_seconds <= 59) {
        return I18n.t('less_than_x_minutes', {scope: ['datetime','distance_in_words'], count: 1});
      } else {
        return I18n.t('x_minutes', {scope: ['datetime','distance_in_words'], count: 1});
      }
    } else {
      return distance_in_minutes == 0 ? I18n.t('less_than_x_minutes', {scope: ['datetime','distance_in_words'], count: 1}) : I18n.t('x_minutes', {scope: ['datetime','distance_in_words'], count: distance_in_minutes});
    }
  } else if (distance_in_minutes <= 44) {
	  return I18n.t('x_minutes', {scope: ['datetime','distance_in_words'], count: distance_in_minutes});
	} else if (distance_in_minutes <= 89) {
	  return I18n.t('about_x_hours', {scope: ['datetime','distance_in_words'], count: 1});
	} else if (distance_in_minutes <= 1439) {
	  return I18n.t('about_x_hours', {scope: ['datetime','distance_in_words'], count: Math.round(distance_in_minutes / 60.0)});
	} else if (distance_in_minutes <= 2529) {
	  return I18n.t('x_days', {scope: ['datetime','distance_in_words'], count: 1});
	} else if (distance_in_minutes <= 43199) {
	  return I18n.t('x_days', {scope: ['datetime','distance_in_words'], count: Math.round(distance_in_minutes / 1440.0)});
	} else if (distance_in_minutes <= 86399) {
	  return I18n.t('about_x_months', {scope: ['datetime','distance_in_words'], count: 1});
	} else if (distance_in_minutes <= 525599) {
	  return I18n.t('x_months', {scope: ['datetime','distance_in_words'], count: Math.round(distance_in_minutes / 43200.0)});
	} else {
	  var distance_in_years = distance_in_minutes / 525600
	  var minute_offset_for_leap_year = (distance_in_years / 4) * 1440
	  var remainder = ((distance_in_minutes - minute_offset_for_leap_year) % 525600)
	  if (remainder < 131400) {
	    return I18n.t('about_x_years', {scope: ['datetime','distance_in_words'], count: distance_in_years});
	  } else if (remainder < 394200) {
	    return I18n.t('over_x_years', {scope: ['datetime','distance_in_words'], count: distance_in_years});
	  } else {
	    return I18n.t('almost_x_years', {scope: ['datetime','distance_in_words'], count: distance_in_years + 1});
	  }
	}
}

function displayCacheableDynamicBlocks(class_selector, logged_in_user_id, is_admin) {
  $(class_selector).each(function() {
    var ownerId = $(this).data('owner-id');

    if(is_admin || ownerId == logged_in_user_id) {
      $(this).fadeIn("slow");
    }
  });
}

$(function() {
  
  $('.time_ago_in_words').each(function(){
    var timestamp = $(this).attr('data-timestamp');
    var date = Date.parse(timestamp);
    var include_seconds = $(this).attr('data-include-seconds') == 'true';
    $(this).html(time_ago_in_words(date, include_seconds));
  });

});