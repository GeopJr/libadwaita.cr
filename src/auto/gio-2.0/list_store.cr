require "../g_object-2.0/object"
require "./list_model"

module Gio
  # #GListStore is a simple implementation of #GListModel that stores all
  # items in memory.
  #
  # It provides insertions, deletions, and lookups in logarithmic time
  # with a fast path for the common case of iterating the list linearly.
  @[GObject::GeneratedWrapper]
  class ListStore < GObject::Object
    include ListModel

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::ListStoreClass), class_init,
        sizeof(LibGio::ListStore), instance_init, 0)
    end

    GICrystal.define_new_method(ListStore, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ListStore`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, item_type : UInt64? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !item_type.nil?
        (_names.to_unsafe + _n).value = "item-type".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, item_type)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ListStore.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Creates a new #GListStore with items of type @item_type. @item_type
    # must be a subclass of #GObject.
    def self.new(item_type : UInt64) : self
      # g_list_store_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_list_store_new(item_type)

      # Return value handling

      Gio::ListStore.new(_retval, GICrystal::Transfer::Full)
    end

    # Appends @item to @store. @item must be of type #GListStore:item-type.
    #
    # This function takes a ref on @item.
    #
    # Use g_list_store_splice() to append multiple items at the same time
    # efficiently.
    def append(item : GObject::Object) : Nil
      # g_list_store_append: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_list_store_append(@pointer, item)

      # Return value handling
    end

    # Looks up the given @item in the list store by looping over the items until
    # the first occurrence of @item. If @item was not found, then @position will
    # not be set, and this method will return %FALSE.
    #
    # If you need to compare the two items with a custom comparison function, use
    # g_list_store_find_with_equal_func() with a custom #GEqualFunc instead.
    def find(item : GObject::Object) : Bool
      # g_list_store_find: (Method)
      # @position: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      position = Pointer(UInt32).null
      # C call
      _retval = LibGio.g_list_store_find(@pointer, item, position)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Looks up the given @item in the list store by looping over the items and
    # comparing them with @compare_func until the first occurrence of @item which
    # matches. If @item was not found, then @position will not be set, and this
    # method will return %FALSE.
    def find_with_equal_func(item : GObject::Object, equal_func : GLib::EqualFunc) : Bool
      # g_list_store_find_with_equal_func: (Method)
      # @position: (out) (transfer full) (optional)
      # Returns: (transfer none)

      # Generator::OutArgUsedInReturnPlan
      position = Pointer(UInt32).null
      # C call
      _retval = LibGio.g_list_store_find_with_equal_func(@pointer, item, equal_func, position)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Inserts @item into @store at @position. @item must be of type
    # #GListStore:item-type or derived from it. @position must be smaller
    # than the length of the list, or equal to it to append.
    #
    # This function takes a ref on @item.
    #
    # Use g_list_store_splice() to insert multiple items at the same time
    # efficiently.
    def insert(position : UInt32, item : GObject::Object) : Nil
      # g_list_store_insert: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_list_store_insert(@pointer, position, item)

      # Return value handling
    end

    # Inserts @item into @store at a position to be determined by the
    # @compare_func.
    #
    # The list must already be sorted before calling this function or the
    # result is undefined.  Usually you would approach this by only ever
    # inserting items by way of this function.
    #
    # This function takes a ref on @item.
    def insert_sorted(item : GObject::Object, compare_func : GLib::CompareDataFunc, user_data : Pointer(Void)?) : UInt32
      # g_list_store_insert_sorted: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      _retval = LibGio.g_list_store_insert_sorted(@pointer, item, compare_func, user_data)

      # Return value handling

      _retval
    end

    # Removes the item from @store that is at @position. @position must be
    # smaller than the current length of the list.
    #
    # Use g_list_store_splice() to remove multiple items at the same time
    # efficiently.
    def remove(position : UInt32) : Nil
      # g_list_store_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_list_store_remove(@pointer, position)

      # Return value handling
    end

    # Removes all items from @store.
    def remove_all : Nil
      # g_list_store_remove_all: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_list_store_remove_all(@pointer)

      # Return value handling
    end

    # Sort the items in @store according to @compare_func.
    def sort(compare_func : GLib::CompareDataFunc, user_data : Pointer(Void)?) : Nil
      # g_list_store_sort: (Method)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGio.g_list_store_sort(@pointer, compare_func, user_data)

      # Return value handling
    end

    # Changes @store by removing @n_removals items and adding @n_additions
    # items to it. @additions must contain @n_additions items of type
    # #GListStore:item-type.  %NULL is not permitted.
    #
    # This function is more efficient than g_list_store_insert() and
    # g_list_store_remove(), because it only emits
    # #GListModel::items-changed once for the change.
    #
    # This function takes a ref on each item in @additions.
    #
    # The parameters @position and @n_removals must be correct (ie:
    # @position + @n_removals must be less than or equal to the length of
    # the list at the time this function is called).
    def splice(position : UInt32, n_removals : UInt32, additions : Enumerable(GObject::Object)) : Nil
      # g_list_store_splice: (Method)
      # @additions: (array length=n_additions element-type Interface)
      # Returns: (transfer none)

      # Generator::ArrayLengthArgPlan
      n_additions = additions.size # Generator::ArrayArgPlan
      additions = additions.to_a.map(&.to_unsafe).to_unsafe

      # C call
      LibGio.g_list_store_splice(@pointer, position, n_removals, additions, n_additions)

      # Return value handling
    end
  end
end
