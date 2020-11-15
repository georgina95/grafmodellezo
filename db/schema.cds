namespace elte.grafmodellezo;

entity Tweets {
    key id          : UUID          @title : 'TWEET ID';
        created_at  : Date          @title : 'CREATED';
        text        : String        @title : 'TWEET TEXT';
        truncated   : Boolean       @title : 'TRUNCATED';

        place_id    : UUID          @title : 'PLACE';
        user_id     : UUID          @title : 'USER';

        place : Association[1..1] to Places on place.id = place_id;
        user : Association[1..1] to Users on user.id = user_id;
}

entity Users {
    key id          : UUID          @title : 'USER ID';
        created_at  : Date          @title : 'CREATED';
        name        : String        @title : 'USERNAME';
        screen_name : String        @title : 'SCREEN_NAME';
        description : String        @title : 'DESCRIPTION';
        followers_count : Integer   @title : 'FOLLOWERS';
        statuses_count  : Integer   @title : 'STATUSES';
        location    : String        @title : 'LOCATION';

        tweets : Association[*] to Tweets on tweets.user_id = id;
}

entity Places {
    key id          : UUID          @title : 'PLACE ID';
        name        : String        @title : 'PLACE NAME';
        full_name   : String        @title : 'FULL NAME';
        country     : String        @title : 'COUNTRY';
        country_code: String        @title : 'COUNTRY CODE';
        place_type  : String        @title : 'PLACE TYPE';

        tweets : Association[*] to Tweets on tweets.place_id = id;
}

entity Hashtags {
    key text        : String        @title : 'TEXT';
    key tweet_id    : UUID          @title : 'TWEET';

    tweet : Association[1..1] to Tweets on tweet.id = tweet_id;
}

entity Mentions {
    key mentioned_user_id   : UUID          @title : 'MENTIONED_USER';
    key tweet_id            : UUID          @title : 'TWEET';

    tweet : Association[1..1] to Tweets on tweet.id = tweet_id;
}
