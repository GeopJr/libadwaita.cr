module Gio
  # #GListModel is an interface that represents a mutable list of
  # #GObjects. Its main intention is as a model for various widgets in
  # user interfaces, such as list views, but it can also be used as a
  # convenient method of returning lists of data, with support for
  # updates.
  #
  # Each object in the list may also report changes in itself via some
  # mechanism (normally the #GObject::notify signal).  Taken together
  # with the #GListModel::items-changed signal, this provides for a list
  # that can change its membership, and in which the members can change
  # their individual properties.
  #
  # A good example would be the list of visible wireless network access
  # points, where each access point can report dynamic properties such as
  # signal strength.
  #
  # It is important to note that the #GListModel itself does not report
  # changes to the individual items.  It only reports changes to the list
  # membership.  If you want to observe changes to the objects themselves
  # then you need to connect signals to the objects that you are
  # interested in.
  #
  # All items in a #GListModel are of (or derived from) the same type.
  # g_list_model_get_item_type() returns that type.  The type may be an
  # interface, in which case all objects in the list must implement it.
  #
  # The semantics are close to that of an array:
  # g_list_model_get_n_items() returns the number of items in the list and
  # g_list_model_get_item() returns an item at a (0-based) position. In
  # order to allow implementations to calculate the list length lazily,
  # you can also iterate over items: starting from 0, repeatedly call
  # g_list_model_get_item() until it returns %NULL.
  #
  # An implementation may create objects lazily, but must take care to
  # return the same object for a given position until all references to
  # it are gone.
  #
  # On the other side, a consumer is expected only to hold references on
  # objects that are currently "user visible", in order to facilitate the
  # maximum level of laziness in the implementation of the list and to
  # reduce the required number of signal connections at a given time.
  #
  # This interface is intended only to be used from a single thread.  The
  # thread in which it is appropriate to use it depends on the particular
  # implementation, but typically it will be from the thread that owns
  # the [thread-default main context][g-main-context-push-thread-default]
  # in effect at the time that the model was created.
  module ListModel
    def item_type : UInt64
      # g_list_model_get_item_type: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_list_model_get_item_type(self)
      _retval
    end

    def n_items : UInt32
      # g_list_model_get_n_items: (Method)
      # Returns: (transfer none)

      _retval = LibGio.g_list_model_get_n_items(self)
      _retval
    end

    def item(position : UInt32) : GObject::Object?
      # g_list_model_get_object: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_list_model_get_object(self, position)
      GObject::Object.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def items_changed(position : UInt32, removed : UInt32, added : UInt32) : Nil
      # g_list_model_items_changed: (Method)
      # Returns: (transfer none)

      LibGio.g_list_model_items_changed(self, position, removed, added)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class ListModel__Impl
    include ListModel

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_list_model_get_type
    end

    # Cast a `GObject::Object` to `ListModel`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to ListModel")
    end

    # Cast a `GObject::Object` to `ListModel`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
