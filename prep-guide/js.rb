Q. Ajax in JQuery -

  $.ajax({
    url: 'https://api.example.com/data',
    method: 'GET', # or 'POST', 'PUT', 'DELETE', etc.
    dataType: 'json', # Expected data type from the server
    data: { key: 'value' }, # Data to send to the server
    success: function(response) {
        // Handle the success response
    },
    error: function(xhr, status, error) {
        // Handle errors
    },
    complete: function(xhr, status) {
        // This function is always called after success or error
    }
  });

  $.ajax({
    url: 'https://api.example.com/data',
    method: 'GET', # or 'POST', 'PUT', 'DELETE', etc.
    dataType: 'json', # Expected data type from the server
    data: { key: 'value' }, # Data to send to the server
    success: function(response) {
        // Handle the success response
    },
    error: function(xhr, status, error) {
        // Handle errors
    },
    complete: function(xhr, status) {
        // This function is always called after success or error
    }
  });


  # The $.get() method is a shorthand for performing HTTP GET requests.
  $.get(url, data, success);
  $.get('https://jsonplaceholder.typicode.com/posts', function(data) {
    console.log('Data retrieved:', data);
  });

  # The $.post() method is a shorthand for performing HTTP POST requests.
  $.post(url, data, success);
  $.post('https://jsonplaceholder.typicode.com/posts', { title: 'foo', body: 'bar', userId: 1 }, function(response) {
    console.log('Data posted:', response);
  });

  # The $.getJSON() method is a shorthand for performing HTTP GET requests where the response is expected to be JSON.
  $.getJSON(url, data, success);
  $.getJSON('https://jsonplaceholder.typicode.com/posts', function(data) {
    console.log('JSON data retrieved:', data);
  });
