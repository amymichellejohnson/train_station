class Line

  attr_reader(:line_name, :line_id)
  define_method(:initialize) do |attributes|
    @line_name = attributes.fetch(:line_name)
    @line_id = attributes.fetch(:line_id)
  end

  define_singleton_method(:all) do
    returned_lines = DB.exec("SELECT * FROM line;")
    line_array = []
    returned_lines.each() do |line|
      line_name = line.fetch("name")
      line_id = line.fetch("id").to_i()
      line_array.push(Line.new({:line_name => line_name, :line_id => line_id}))
    end
    line_array
  end

  define_singleton_method(:find) do |id|
     found_line = nil
     Line.all().each() do |line|
       if line.line_id().==(id)
         found_line = line
       end
     end
     found_line
   end

  define_method(:save) do
    result = DB.exec("INSERT INTO line (name) VALUES  ('#{@line_name}') RETURNING id;")
    @line_id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_line|
    self.line_name().==(another_line.line_name()).&(self.line_id().==(another_line.line_id()))
  end



end
