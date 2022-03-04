require "../g_object-2.0/object"
require "./list_model"

module Gio
  # #GListStore is a simple implementation of #GListModel that stores all
  # items in memory.
  #
  # It provides insertions, deletions, and lookups in logarithmic time
  # with a fast path for the common case of iterating the list linearly.
  class ListStore < GObject::Object
    include ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, item_type : UInt64? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if item_type
        (_names.to_unsafe + _n).value = "item-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, item_type)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ListStore.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_list_store_get_type
    end

    def item_type=(value : UInt64) : UInt64
      unsafe_value = value

      LibGObject.g_object_set(self, "item-type", unsafe_value, Pointer(Void).null)
      value
    end

    def item_type : UInt64
      # Returns: None

      value = uninitialized UInt64
      LibGObject.g_object_get(self, "item-type", pointerof(value), Pointer(Void).null)
      value
    end

    def initialize(item_type : UInt64)
      # g_list_store_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_list_store_new(item_type)

      # Return value handling
      @pointer = _retval
    end

    def append(item : GObject::Object) : Nil
      # g_list_store_append: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_list_store_append(self, item)

      # Return value handling
    end

    def find(item : GObject::Object) : Bool
      # g_list_store_find: (Method)
      # @position: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      position = Pointer(UInt32).null

      # C call
      _retval = LibGio.g_list_store_find(self, item, position)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def find_with_equal_func(item : GObject::Object, equal_func : Pointer(Void)) : Bool
      # g_list_store_find_with_equal_func: (Method)
      # @position: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Handle parameters
      position = Pointer(UInt32).null

      # C call
      _retval = LibGio.g_list_store_find_with_equal_func(self, item, equal_func, position)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def insert(position : UInt32, item : GObject::Object) : Nil
      # g_list_store_insert: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_list_store_insert(self, position, item)

      # Return value handling
    end

    def insert_sorted(item : GObject::Object, compare_func : Pointer(Void), user_data : Pointer(Void)?) : UInt32
      # g_list_store_insert_sorted: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      _retval = LibGio.g_list_store_insert_sorted(self, item, compare_func, user_data)

      # Return value handling
      _retval
    end

    def remove(position : UInt32) : Nil
      # g_list_store_remove: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_list_store_remove(self, position)

      # Return value handling
    end

    def remove_all : Nil
      # g_list_store_remove_all: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_list_store_remove_all(self)

      # Return value handling
    end

    def sort(compare_func : Pointer(Void), user_data : Pointer(Void)?) : Nil
      # g_list_store_sort: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_list_store_sort(self, compare_func, user_data)

      # Return value handling
    end

    def splice(position : UInt32, n_removals : UInt32, additions : Enumerable(GObject::Object)) : Nil
      # g_list_store_splice: (Method)
      # @additions: (array length=n_additions element-type Interface)
      # Returns: (transfer none)

      # Handle parameters
      n_additions = additions.size
      additions = additions.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGio.g_list_store_splice(self, position, n_removals, additions, n_additions)

      # Return value handling
    end
  end
end
