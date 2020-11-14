require 'byebug'
require_relative '../models/post'
require_relative '../views/posts_view'

class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    post = Post.all
    @view.list(post)
  end

  def create
    post_info = @view.add_to_db
    new_post = Post.new(post_info)
    new_post.save
  end

  def update
    index
    id_info = @view.update_the_db
    find_id = Post.find(id_info[:id])
    title_url_info = @view.add_to_db
    full_info = { "id" => id_info[:id].to_i,
                  "title" => title_url_info[:title],
                  "url" => title_url_info[:url] }
    updated_post = Post.build_record(full_info)
    updated_post.save
  end

  def destroy
    index
    id_info = @view.destroy_from_db
    find_id = Post.find(id_info[:id])
    find_id.destroy
  end

  def upvote
    index
    id_info = @view.upvote
    updated_post = Post.find(id_info[:id])
    updated_post.votes += 1
    updated_post.save
  end
end
