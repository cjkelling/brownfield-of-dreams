namespace :update_videos do
  task all: %i[update_video_positions]

  task :update_video_positions, [:update_video_positions] => :environment do
    Video.all.each do |video|
      video.update_attributes(position: 0) unless video.position
    end
  end
end