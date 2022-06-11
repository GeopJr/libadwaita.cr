require "./filter"

module Gtk
  # `GtkStringFilter` determines whether to include items by comparing
  # strings to a fixed search term.
  #
  # The strings are obtained from the items by evaluating a `GtkExpression`
  # set with `Gtk::StringFilter#expression=`, and they are
  # compared against a search term set with `Gtk::StringFilter#search=`.
  #
  # `GtkStringFilter` has several different modes of comparison - it
  # can match the whole string, just a prefix, or any substring. Use
  # `Gtk::StringFilter#match_mode=` choose a mode.
  #
  # It is also possible to make case-insensitive comparisons, with
  # `Gtk::StringFilter#ignore_case=`.
  @[GObject::GeneratedWrapper]
  class StringFilter < Filter
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::StringFilterClass), class_init,
        sizeof(LibGtk::StringFilter), instance_init, 0)
    end

    GICrystal.define_new_method(StringFilter, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `StringFilter`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, expression : Gtk::Expression? = nil, ignore_case : Bool? = nil, match_mode : Gtk::StringFilterMatchMode? = nil, search : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if !expression.nil?
        (_names.to_unsafe + _n).value = "expression".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expression)
        _n += 1
      end
      if !ignore_case.nil?
        (_names.to_unsafe + _n).value = "ignore-case".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ignore_case)
        _n += 1
      end
      if !match_mode.nil?
        (_names.to_unsafe + _n).value = "match-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, match_mode)
        _n += 1
      end
      if !search.nil?
        (_names.to_unsafe + _n).value = "search".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, search)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(StringFilter.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_string_filter_get_type
    end

    def expression=(value : Gtk::Expression?) : Gtk::Expression?
      unsafe_value = value

      LibGObject.g_object_set(self, "expression", unsafe_value, Pointer(Void).null)
      value
    end

    def expression : Gtk::Expression?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "expression", pointerof(value), Pointer(Void).null)
      Gtk::Expression.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def ignore_case=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "ignore-case", unsafe_value, Pointer(Void).null)
      value
    end

    def ignore_case? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "ignore-case", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def match_mode=(value : Gtk::StringFilterMatchMode) : Gtk::StringFilterMatchMode
      unsafe_value = value

      LibGObject.g_object_set(self, "match-mode", unsafe_value, Pointer(Void).null)
      value
    end

    def match_mode : Gtk::StringFilterMatchMode
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "match-mode", pointerof(value), Pointer(Void).null)
      Gtk::StringFilterMatchMode.new(value)
    end

    def search=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "search", unsafe_value, Pointer(Void).null)
      value
    end

    def search : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "search", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates a new string filter.
    #
    # You will want to set up the filter by providing a string to search for
    # and by providing a property to look up on the item.
    def self.new(expression : Gtk::Expression?) : self
      # gtk_string_filter_new: (Constructor)
      # @expression: (transfer full) (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end
      # Generator::TransferFullArgPlan
      LibGObject.gtk_expression_ref(expression)
      # C call
      _retval = LibGtk.gtk_string_filter_new(expression)

      # Return value handling

      Gtk::StringFilter.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets the expression that the string filter uses to
    # obtain strings from items.
    def expression : Gtk::Expression?
      # gtk_string_filter_get_expression: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_string_filter_get_expression(@pointer)

      # Return value handling

      Gtk::Expression.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns whether the filter ignores case differences.
    def ignore_case : Bool
      # gtk_string_filter_get_ignore_case: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_string_filter_get_ignore_case(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the match mode that the filter is using.
    def match_mode : Gtk::StringFilterMatchMode
      # gtk_string_filter_get_match_mode: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_string_filter_get_match_mode(@pointer)

      # Return value handling

      Gtk::StringFilterMatchMode.new(_retval)
    end

    # Gets the search term.
    def search : ::String?
      # gtk_string_filter_get_search: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_string_filter_get_search(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Sets the expression that the string filter uses to
    # obtain strings from items.
    #
    # The expression must have a value type of %G_TYPE_STRING.
    def expression=(expression : Gtk::Expression?) : Nil
      # gtk_string_filter_set_expression: (Method | Setter)
      # @expression: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end

      # C call
      LibGtk.gtk_string_filter_set_expression(@pointer, expression)

      # Return value handling
    end

    # Sets whether the filter ignores case differences.
    def ignore_case=(ignore_case : Bool) : Nil
      # gtk_string_filter_set_ignore_case: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_string_filter_set_ignore_case(@pointer, ignore_case)

      # Return value handling
    end

    # Sets the match mode for the filter.
    def match_mode=(mode : Gtk::StringFilterMatchMode) : Nil
      # gtk_string_filter_set_match_mode: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_string_filter_set_match_mode(@pointer, mode)

      # Return value handling
    end

    # Sets the string to search for.
    def search=(search : ::String?) : Nil
      # gtk_string_filter_set_search: (Method | Setter)
      # @search: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      search = if search.nil?
                 Pointer(LibC::Char).null
               else
                 search.to_unsafe
               end

      # C call
      LibGtk.gtk_string_filter_set_search(@pointer, search)

      # Return value handling
    end
  end
end
