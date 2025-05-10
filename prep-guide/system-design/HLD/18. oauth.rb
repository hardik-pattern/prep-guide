# ---------------------------------------------------------------------------------------------------------------------
#* What is OAuth (Open Authorization)?
# ---------------------------------------------------------------------------------------------------------------------

#  It is authorization framework, It enables third party access to protected resources without sharing credentials.
# There are 4 roles in OAuth:
  # 1. Resource Owner: The user who owns the data and grants access to it.
  # 2. Client: The application requesting access to the resource owner's data.
  # 3. Authorization Server: The server that issues access tokens to the client after successfully authenticating the resource owner.
  # 4. Resource Server: The server hosting the protected resources that the client wants to access.

  # Consider the following example:
    # I am a user (Hardik) who wants to sign-in the leetcode using gmail account:
    #  Hardik is the resource owner,
    # leetcode is the client,
    # google authenticating is the authorization server
    # Gmail is the resource server.

# Authorization Code Flow:

# Resource Owner(Hardik)                       Client(leetcode)                     Gmail Auth Server                      Gmail
#     |                                          |                                    |                                      |
#     |                                          |         1. Registration            |                                      |
#     |                                          +----------------------------------->+                                      |
#     |                                          |                                    |                                      |
#     |                                          |                                    |                                      |
#     |                                          |   2. Client Id And Client Secret   |                                      |
#     |                                          +<-----------------------------------+                                      |
#     |                                          |                                    |                                      |
#     |                                          |                                    |                                      |
#     | 3. Sign In Using Google                  |                                    |                                      |
#     +----------------------------------------->+                                    |                                      |
#     |                                          |                                    |                                      |
#     |                                          |                                    |                                      |
#     |                                          |4. Redirect to authorization server |                                      |
#     |                                          +----------------------------------->+                                      |
#     |                                          |                                    |                                      |
#     |                                          |                                    |                                      |
#     |                                          |                                    |                                      |
#     |                                          |                             5. User authenticate and                      |
#     |                                          |                                    provide consent                        |
#     |                                          |                                    |                                      |
#     |                                          |                                    |                                      |
#     |                                          |  6. Provides auth code             |                                      |
#     |                                          +<-----------------------------------+                                      |
#     |                                          |                                    |                                      |
#     |                                          |                                    |                                      |
#     |                                          | 7. Request token using auth code   |                                      |
#     |                                          +----------------------------------->+                                      |
#     |                                          |                                    |                                      |
#     |                                          |                                    |                                      |
#     |                                          | 8. Gets access token and refresh token                                    |
#     |                                          +<-----------------------------------+                                      |
#     |                                          |                                    |                                      |
#     |                                          |                                    |                                      |
#     |                                          | 9. Request resources or data       |                                      |
#     |                                          +-------------------------------------------------------------------------->|
#     |                                          |                                    |                                      |
