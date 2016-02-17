# Video Blog App
Video Blog is blog about videos, especially YouTube videos.

## Motivation & Assignment
It's final project for course [Development in Ruby](https://github.com/municz/study-materials/wiki).
```
1. New users can sign up (also OmniAuth support), log in and write a post about some YouTube video.
2. Through YouTube API are obtained some statistics about videos.
3. Description field of the post is the best place to include some hashtags about the post.
4. Writing comments to these posts are available.
5. Replying to a comment of the post is available.
6. Posts/comments could be rated.
7. Videos could be sorted by categories (obtained from YouTube API).
8. Embedded player of videos is available.
9. Sorting of videos based on various attributes is performed.
10. Users logged in via Google account can like the video (liking videos on YouTube) through this blog. [NYI][postponed]
```

## Installation & Usage
### Google API Setup
Refers to https://github.com/zquestz/omniauth-google-oauth2#google-api-setup.
(IMHO, the last step is not necessary)

### Google API Credentials Setup
On the Create client ID page select `Web application` as an application type. In the restrictions section, type `http://localhost:3000` into the field Authorized JavaScript origins, and `http://localhost:3000/users/auth/google_oauth2/callback` into the field Authorized redirect URIs.
Click Create and define environment variables in your IDE, particularly for this project:
```
GOOGLE_CLIENT_ID = <your client ID>
GOOGLE_CLIENT_SECRET = <your client secret>.
```
Finally, start rails development server at [http://localhost:3000](http://localhost:3000).

### YouTube API Setup
Refers to https://github.com/Fullscreen/yt#configuring-your-app. We just need to retrieve public data from YouTube, so Server API key is enough so far. Particularly for this project, define environment variable:
```
API_KEY = <your API key>
```

## Code Example
The following example focuses on callback action responsible for creation of association between Category and Video model, where `category_title` is attribute of Video model obtained from YouTube API, hence no manual nameing of the category is needed.  
```ruby
class Video < ActiveRecord::Base
  has_and_belongs_to_many :category
  
  # some code ommitted
  
  after_save :check_category

  def check_category
    category << Category.find_or_create_by!(name: category_title)
  end
end
```

## Heroku deployment
Application is available at http://peaceful-eyrie-28867.herokuapp.com/.
