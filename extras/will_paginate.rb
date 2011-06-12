module WillPaginate
  module ViewHelpers
    alias_method :will_paginate_without_gettext, :will_paginate
    def will_paginate(collection = nil, options = {})
      will_paginate_without_gettext(collection, {:previous_label => '&laquo; ' + _('Poprzednia'), :next_label => _('Następna') + ' &raquo;'}.merge(options))
    end
  end
end
