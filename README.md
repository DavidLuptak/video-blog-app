# Video Blog App
Video Blog is blog about videos, especially YouTube videos.

## Motivation & Assignment
It's final project for course [Development in Ruby](https://github.com/municz/study-materials/wiki).
```
1. New users can sign up (also OmniAuth support), log in and write a post about some YouTube video.
2. Through YouTube API are obtained some statistics about videos.
3. Description field of the post is the best place to include some hashtags about the post.
4. Writing comments to these posts are available.
5. Replying to a comment of the post is available. [NYI]
6. Posts/comments could be rated. [NYI]
7. Videos could be sorted by categories (obtained from YouTube API). [NYI]
8. Embedded player of videos is available. [NYI]
9. Sorting of videos based on various attributes is performed. [NYI]
10. Users logged in via Google account can like the video (liking videos on YouTube) through this blog. [NYI]
```

## Installation & Usage
### Google API Setup
Refers to https://github.com/zquestz/omniauth-google-oauth2#google-api-setup.
(IMHO is not necessary the last step)

### Google API Credentials Setup
On the Create client ID page select `Web application` as an application type. And now the most important things follow:
In the restrictions section, type `http://localhost:3000` into the field Authorized JavaScript origins, and `http://localhost:3000/users/auth/google_oauth2/callback` into field Authorized redirect URIs.
Click Create and in your IDE define environment variables, particularly for this project:
```
GOOGLE_CLIENT_ID = <your client ID>
GOOGLE_CLIENT_SECRET = <your client secret>.
```
Finally, start rails development server at [http://localhost:3000](http://localhost:3000).

## Heroku deployment
Application will be available at heroku server.