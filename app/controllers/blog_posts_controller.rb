class BlogPostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  # constant refrenced multipe times so seta s variable for any future chnges to not misalign
  POSTS_PER_PAGE = 3

  def index
    # get from params page number for paignation. fetch used as can set default (0 here), convert to_i for calcualtion use
    @page = params.fetch(:page, 0).to_i
    # policy_scope from pundit, chained offset for where to start in the list
    #then chained limit so only 3 show per page.
    @blogposts = policy_scope(BlogPost).offset(@page * POSTS_PER_PAGE).limit(POSTS_PER_PAGE)
  end
end
