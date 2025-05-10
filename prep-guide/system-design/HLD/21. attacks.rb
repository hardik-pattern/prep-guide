# CSRF Attack:
  #   - user is already logged-in to the site
  #   - CSRF tricks the user to click on unwanted site. Here browser adds the cookies to the request
  #   - It is applicable where the state and session is managed

  # Ways to get protected from CSRF attack:
  #   - use CSRF token. Here server returns this token to only authenticated domain and if in any request server didn't get this token it will raise an error

# XSS Attack:
  #   - It allow the attacker to put the malicious script into a web page.
  #   - Like inside comment section, post section etc

  # Way to get protected:
    # do not allow special character where we take input from user

# CORS(Cross origin resource sharing)
  #   it is not attack it is a security feature where we restrict the webpage from making call to different origin
  #   We can configure at server side to allow only request from particular origin

# SQL Injection:
  #  Here attacker puts the malicious script inside the input field.
  # If not properly handled it could get execute at database level resulting in data breach.
