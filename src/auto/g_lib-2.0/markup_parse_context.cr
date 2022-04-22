module GLib
  # A parse context is used to parse a stream of bytes that
  # you expect to contain marked-up text.
  #
  # See g_markup_parse_context_new(), #GMarkupParser, and so
  # on for more details.
  class MarkupParseContext
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibGObject.g_boxed_copy(MarkupParseContext.g_type, pointer)
                 else
                   pointer
                 end
    end

    def finalize
      LibGObject.g_boxed_free(MarkupParseContext.g_type, self)
    end

    def ==(other : self) : Bool
      LibC.memcmp(self, other.to_unsafe, sizeof(LibGLib::MarkupParseContext)).zero?
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGLib.g_markup_parse_context_get_type
    end

    def initialize(parser : GLib::MarkupParser, flags : GLib::MarkupParseFlags, user_data : Pointer(Void)?, user_data_dnotify : Pointer(Void))
      # g_markup_parse_context_new: (Constructor)
      # @user_data: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      _retval = LibGLib.g_markup_parse_context_new(parser, flags, user_data, user_data_dnotify)

      # Return value handling

      @pointer = _retval
    end

    def end_parse : Bool
      # g_markup_parse_context_end_parse: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGLib.g_markup_parse_context_end_parse(self, pointerof(_error))

      # Error check
      GLib.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # g_markup_parse_context_free: (Method)
      # Returns: (transfer none)

      # C call
      LibGLib.g_markup_parse_context_free(self)

      # Return value handling
    end

    def element : ::String
      # g_markup_parse_context_get_element: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_markup_parse_context_get_element(self)

      # Return value handling

      ::String.new(_retval)
    end

    def position : Nil
      # g_markup_parse_context_get_position: (Method)
      # @line_number: (out) (transfer full) (optional)
      # @char_number: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      line_number = Pointer(Int32).null
      # Generator::OutArgUsedInReturnPlan
      char_number = Pointer(Int32).null

      # C call
      LibGLib.g_markup_parse_context_get_position(self, line_number, char_number)

      # Return value handling
    end

    def user_data : Pointer(Void)?
      # g_markup_parse_context_get_user_data: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_markup_parse_context_get_user_data(self)

      # Return value handling

      _retval unless _retval.null?
    end

    def parse(text : ::String, text_len : Int64) : Bool
      # g_markup_parse_context_parse: (Method | Throws)
      # Returns: (transfer none)

      _error = Pointer(LibGLib::Error).null

      # C call
      _retval = LibGLib.g_markup_parse_context_parse(self, text, text_len, pointerof(_error))

      # Error check
      GLib.raise_exception(_error) unless _error.null?

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def pop : Pointer(Void)?
      # g_markup_parse_context_pop: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGLib.g_markup_parse_context_pop(self)

      # Return value handling

      _retval unless _retval.null?
    end

    def push(parser : GLib::MarkupParser, user_data : Pointer(Void)?) : Nil
      # g_markup_parse_context_push: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGLib.g_markup_parse_context_push(self, parser, user_data)

      # Return value handling
    end

    def ref : GLib::MarkupParseContext
      # g_markup_parse_context_ref: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGLib.g_markup_parse_context_ref(self)

      # Return value handling

      GLib::MarkupParseContext.new(_retval, GICrystal::Transfer::Full)
    end

    def unref : Nil
      # g_markup_parse_context_unref: (Method)
      # Returns: (transfer none)

      # C call
      LibGLib.g_markup_parse_context_unref(self)

      # Return value handling
    end

    def to_unsafe
      @pointer
    end
  end
end
