class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.movies_with_same_director(movie)
    Movie.where(director: movie.director).where.not(id: movie.id)
  end

  def self.get_id_from_title(title)
    Movie.select(:id).find_by(title: title)
  end
end
