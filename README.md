# Referral App

## About

This is an app with which users can share their referral code and get credit for
referring new users.

## How to Run

```
$ bundle install
$ bundle exec rake db:create db:migrate
$ rails server
```

## How to run tests

```
$ bundle exec rake spec
```

## Notes

* Used Clearance gem for basic sign-up/login/logout system
* I included Clearance gem specs (spec/features/clearance folder) to help prevent regressions in Clearance's integration with this app over time
* Used the hashids gem to generate referral codes by encoding the user’s ID (used this gem instead of Base64 module because I liked the way the hashes didn’t have padding). I used encoding instead of generating random codes and storing them in the db, for example:
```
> user_id = 1
> referral_code = Hashids.new.encode(user_id)
=> "jR"
```

