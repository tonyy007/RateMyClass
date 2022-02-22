module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    when /^the signup page$/
      signup_path
    when /^homepage$/
      homepage_path
    when /^users database page$/
      users_path
    when /^indexupper page$/
      indexupper_path
    when /^login page$/
      login_path
    when /^reviews page$/
      reviews_path
    when /^new reviews page$/
      new_review_path
    # when /^the (RottenPotatoes )?home\s?page$/ then '/movies'


    # when /^the edit page for "(.*)"$/
    #   movie = Movie.find_by_title($1)
    #   edit_movie_path(movie)
    # when /^the details page for "(.*)"$/
    #   movie = Movie.find_by_title($1)
    #   movie_path(movie)
    # when /^the Similar Movies page for "(.*)"$/
    #   movie = Movie.find_by_title($1)
    #   show_by_director_movie_path(movie)
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)