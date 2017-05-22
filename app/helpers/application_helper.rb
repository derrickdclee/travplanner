module ApplicationHelper
    def sortable(column, title = nil)
        # what does a ||= b mean?
        # it means that if a is not initialized, assign it the value of b
        # but if it's not, then just leave it as it is
        title ||= column.titleize
        direction = column == sort_column && 
        sort_direction == 'asc' ? 'desc' : 'asc'
        link_to title, {sort: column, direction: direction}
    end
end
