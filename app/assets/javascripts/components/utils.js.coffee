filterBy: (value, key) ->
    (course) ->
        if key == 'onlyAdvanced'
            course.level == "A" && value
        else
            true
@filterCourses = (key, value, courses)->
    courses.filter(filterBy(value, key))
