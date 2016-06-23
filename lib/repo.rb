class Repo < Hashie::Mash

  def current_gpa
    last_snapshot.gpa
  end

  def previous_gpa
    previous_snapshot.gpa
  end
end
