module Gtk
  # An opaque context struct for `GtkBuildableParser`.
  class BuildableParseContext
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      @pointer = pointer
    end

    def finalize
    end

    def element : ::String?
      # gtk_buildable_parse_context_get_element: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_buildable_parse_context_get_element(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def element_stack : Enumerable(::String)
      # gtk_buildable_parse_context_get_element_stack: (Method)
      # Returns: (transfer none) (array element-type Utf8)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_buildable_parse_context_get_element_stack(self)

      # Return value handling
      _retval
    end

    def position : Nil
      # gtk_buildable_parse_context_get_position: (Method)
      # @line_number: (out) (transfer full) (optional)
      # @char_number: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      line_number = Pointer(Int32).null
      char_number = Pointer(Int32).null

      # C call
      LibGtk.gtk_buildable_parse_context_get_position(self, line_number, char_number)

      # Return value handling
    end

    def pop : Pointer(Void)?
      # gtk_buildable_parse_context_pop: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_buildable_parse_context_pop(self)

      # Return value handling
      _retval unless _retval.null?
    end

    def push(parser : Gtk::BuildableParser, user_data : Pointer(Void)?) : Nil
      # gtk_buildable_parse_context_push: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGtk.gtk_buildable_parse_context_push(self, parser, user_data)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
