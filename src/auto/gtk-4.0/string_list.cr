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
  # ```xml
  # <object class="GtkStringList">
  #   <items>
  #     <item translatable="yes">Factory</item>
  #     <item translatable="yes">Home</item>
  #     <item translatable="yes">Subway</item>
  #   </items>
  # </object>
  # ```
  class StringList < GObject::Object
    include Gio::ListModel
    include Buildable

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_string_list_get_type
    end

    def initialize(strings : Enumerable(::String)?)
      # gtk_string_list_new: (Constructor)
      # @strings: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer full)

      # Handle parameters
      strings = if strings.nil?
                  Pointer(Pointer(LibC::Char)).null
                else
                  strings.to_a.map(&.to_unsafe).to_unsafe
                end

      # C call
      _retval = LibGtk.gtk_string_list_new(strings)

      # Return value handling
      @pointer = _retval
    end

    def initialize(*strings : ::String)
      initialize(strings)
    end

    def append(string : ::String) : Nil
      # gtk_string_list_append: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_string_list_append(self, string)

      # Return value handling
    end

    def string(position : UInt32) : ::String?
      # gtk_string_list_get_string: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_string_list_get_string(self, position)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def remove(position : UInt32) : Nil
      # gtk_string_list_remove: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_string_list_remove(self, position)

      # Return value handling
    end

    def splice(position : UInt32, n_removals : UInt32, additions : Enumerable(::String)?) : Nil
      # gtk_string_list_splice: (Method)
      # @additions: (nullable) (array zero-terminated=1 element-type Utf8)
      # Returns: (transfer none)

      # Handle parameters
      additions = if additions.nil?
                    Pointer(Pointer(LibC::Char)).null
                  else
                    additions.to_a.map(&.to_unsafe).to_unsafe
                  end

      # C call
      LibGtk.gtk_string_list_splice(self, position, n_removals, additions)

      # Return value handling
    end

    def take(string : ::String) : Nil
      # gtk_string_list_take: (Method)
      # @string: (transfer full)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_string_list_take(self, string)

      # Return value handling
    end
  end
end
