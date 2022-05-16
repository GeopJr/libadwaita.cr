require "../g_object-2.0/object"
require "../gio-2.0/list_model"

require "./buildable"

module Gtk
  # `GtkStringList` is a list model that wraps an array of strings.
  #
  # The objects in the model have a "string" property.
  #
  # `GtkStringList` is well-suited for any place where you would
  # typically use a `char*[]`, but need a list model.
  #
  # # GtkStringList as GtkBuildable
  #
  # The `GtkStringList` implementation of the `GtkBuildable` interface
  # supports adding items directly using the <items> element and
  # specifying <item> elements for each item. Each <item> element
  # supports the regular translation attributes “translatable”,
  # “context” and “comments”.
  #
  # Here is a UI definition fragment specifying a `GtkStringList`
  #
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  # <object class="GtkStringList">
  #   <items>
  #     <item translatable="yes">Factory</item>
  #     <item translatable="yes">Home</item>
  #     <item translatable="yes">Subway</item>
  #   </items>
  # </object>
  # ```
  @[GObject::GeneratedWrapper]
  class StringList < GObject::Object
    include Gio::ListModel
    include Buildable

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::StringListClass), class_init,
        sizeof(LibGtk::StringList), instance_init, 0)
    end

    GICrystal.define_new_method(StringList, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `StringList`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_string_list_get_type
    end

    # Creates a new `GtkStringList` with the given @strings.
    def initialize(strings : Enumerable(::String)?)
      # gtk_string_list_new: (Constructor)
      # @strings: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      strings = if strings.nil?
                  Pointer(Pointer(LibC::Char)).null
                else
                  strings.to_a.map(&.to_unsafe).to_unsafe
                end

      # C call
      _retval = LibGtk.gtk_string_list_new(strings)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    def initialize(*strings : ::String)
      initialize(strings)
    end

    # Appends @string to @self.
    #
    # The @string will be copied. See
    # `Gtk::StringList#take` for a way to avoid that.
    def append(string : ::String) : Nil
      # gtk_string_list_append: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_string_list_append(@pointer, string)

      # Return value handling
    end

    # Gets the string that is at @position in @self.
    #
    # If @self does not contain @position items, %NULL is returned.
    #
    # This function returns the const char *. To get the
    # object wrapping it, use g_list_model_get_item().
    def string(position : UInt32) : ::String?
      # gtk_string_list_get_string: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_string_list_get_string(@pointer, position)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Removes the string at @position from @self.
    #
    # @position must be smaller than the current
    # length of the list.
    def remove(position : UInt32) : Nil
      # gtk_string_list_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_string_list_remove(@pointer, position)

      # Return value handling
    end

    # Changes @self by removing @n_removals strings and adding @additions
    # to it.
    #
    # This function is more efficient than `Gtk::StringList#append`
    # and `Gtk::StringList#remove`, because it only emits the
    # ::items-changed signal once for the change.
    #
    # This function copies the strings in @additions.
    #
    # The parameters @position and @n_removals must be correct (ie:
    # @position + @n_removals must be less than or equal to the length
    # of the list at the time this function is called).
    def splice(position : UInt32, n_removals : UInt32, additions : Enumerable(::String)?) : Nil
      # gtk_string_list_splice: (Method)
      # @additions: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      additions = if additions.nil?
                    Pointer(Pointer(LibC::Char)).null
                  else
                    additions.to_a.map(&.to_unsafe).to_unsafe
                  end

      # C call
      LibGtk.gtk_string_list_splice(@pointer, position, n_removals, additions)

      # Return value handling
    end

    # Adds @string to self at the end, and takes
    # ownership of it.
    #
    # This variant of `Gtk::StringList#append`
    # is convenient for formatting strings:
    #
    #
    #
    # WARNING: **⚠️ The following code is in c ⚠️**
    # ```c
    # gtk_string_list_take (self, g_strdup_print ("%d dollars", lots));
    # ```
    def take(string : ::String) : Nil
      # gtk_string_list_take: (Method)
      # @string: (transfer full)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_string_list_take(@pointer, string)

      # Return value handling
    end
  end
end
