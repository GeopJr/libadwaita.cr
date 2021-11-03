require "./filter"

module Gtk
  # `GtkStringFilter` determines whether to include items by comparing
  # strings to a fixed search term.
  #
  # The strings are obtained from the items by evaluating a `GtkExpression`
  # set with [method@Gtk.StringFilter.set_expression], and they are
  # compared against a search term set with [method@Gtk.StringFilter.set_search].
  #
  # `GtkStringFilter` has several different modes of comparison - it
  # can match the whole string, just a prefix, or any substring. Use
  # [method@Gtk.StringFilter.set_match_mode] choose a mode.
  #
  # It is also possible to make case-insensitive comparisons, with
  # [method@Gtk.StringFilter.set_ignore_case].
  class StringFilter < Filter
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, expression : Gtk::Expression? = nil, ignore_case : Bool? = nil, match_mode : Gtk::StringFilterMatchMode? = nil, search : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[4]
      _values = StaticArray(LibGObject::Value, 4).new(LibGObject::Value.new)
      _n = 0

      if expression
        (_names.to_unsafe + _n).value = "expression".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, expression)
        _n += 1
      end
      if ignore_case
        (_names.to_unsafe + _n).value = "ignore-case".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, ignore_case)
        _n += 1
      end
      if match_mode
        (_names.to_unsafe + _n).value = "match-mode".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, match_mode)
        _n += 1
      end
      if search
        (_names.to_unsafe + _n).value = "search".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, search)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(StringFilter.g_type, _n, _names, _values)
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
      Gtk::StringFilterMatchMode.from_value(value)
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

    def initialize(expression : Gtk::Expression?)
      # gtk_string_filter_new: (Constructor)
      # @expression: (transfer full) (nullable)
      # Returns: (transfer full)

      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end
      LibGObject.g_object_ref(expression)

      _retval = LibGtk.gtk_string_filter_new(expression)
      @pointer = _retval
    end

    def expression : Gtk::Expression?
      # gtk_string_filter_get_expression: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_string_filter_get_expression(self)
      Gtk::Expression.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def ignore_case : Bool
      # gtk_string_filter_get_ignore_case: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_string_filter_get_ignore_case(self)
      GICrystal.to_bool(_retval)
    end

    def match_mode : Gtk::StringFilterMatchMode
      # gtk_string_filter_get_match_mode: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_string_filter_get_match_mode(self)
      Gtk::StringFilterMatchMode.from_value(_retval)
    end

    def search : ::String?
      # gtk_string_filter_get_search: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_string_filter_get_search(self)
      ::String.new(_retval) unless _retval.null?
    end

    def expression=(expression : Gtk::Expression?) : Nil
      # gtk_string_filter_set_expression: (Method | Setter)
      # @expression: (nullable)
      # Returns: (transfer none)

      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end

      LibGtk.gtk_string_filter_set_expression(self, expression)
    end

    def ignore_case=(ignore_case : Bool) : Nil
      # gtk_string_filter_set_ignore_case: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_string_filter_set_ignore_case(self, ignore_case)
    end

    def match_mode=(mode : Gtk::StringFilterMatchMode) : Nil
      # gtk_string_filter_set_match_mode: (Method | Setter)
      # Returns: (transfer none)

      LibGtk.gtk_string_filter_set_match_mode(self, mode)
    end

    def search=(search : ::String?) : Nil
      # gtk_string_filter_set_search: (Method | Setter)
      # @search: (nullable)
      # Returns: (transfer none)

      search = if search.nil?
                 Pointer(LibC::Char).null
               else
                 search.to_unsafe
               end

      LibGtk.gtk_string_filter_set_search(self, search)
    end
  end
end
