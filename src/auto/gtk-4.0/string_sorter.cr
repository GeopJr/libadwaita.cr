require "./sorter"

module Gtk
  # `GtkStringSorter` is a `GtkSorter` that compares strings.
  #
  # It does the comparison in a linguistically correct way using the
  # current locale by normalizing Unicode strings and possibly case-folding
  # them before performing the comparison.
  #
  # To obtain the strings to compare, this sorter evaluates a
  # [class@Gtk.Expression].
  class StringSorter < Sorter
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, expression : Gtk::Expression? = nil, ignore_case : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
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

      @pointer = LibGObject.g_object_new_with_properties(StringSorter.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_string_sorter_get_type
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

    def initialize(expression : Gtk::Expression?)
      # gtk_string_sorter_new: (Constructor)
      # @expression: (transfer full) (nullable)
      # Returns: (transfer full)

      # Handle parameters
      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end
      LibGObject.g_object_ref(expression)

      # C call
      _retval = LibGtk.gtk_string_sorter_new(expression)

      # Return value handling
      @pointer = _retval
    end

    def expression : Gtk::Expression?
      # gtk_string_sorter_get_expression: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_string_sorter_get_expression(self)

      # Return value handling
      Gtk::Expression.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def ignore_case : Bool
      # gtk_string_sorter_get_ignore_case: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_string_sorter_get_ignore_case(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def expression=(expression : Gtk::Expression?) : Nil
      # gtk_string_sorter_set_expression: (Method | Setter)
      # @expression: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      expression = if expression.nil?
                     Pointer(Void).null
                   else
                     expression.to_unsafe
                   end

      # C call
      LibGtk.gtk_string_sorter_set_expression(self, expression)

      # Return value handling
    end

    def ignore_case=(ignore_case : Bool) : Nil
      # gtk_string_sorter_set_ignore_case: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_string_sorter_set_ignore_case(self, ignore_case)

      # Return value handling
    end
  end
end
