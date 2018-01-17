# frozen_string_literal: true

require './app/resources/resourceable'

module Resources
  class Issue
    include Resourceable

    def attr_mapper
      %i[id url repository_url labels_url comments_url events_url html_url number state title body locked
         active_lock_reason comments closed_at created_at updated_at assignees]
    end
  end
end
