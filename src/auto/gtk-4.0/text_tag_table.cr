require "../g_object-2.0/object"
require "./buildable"

module Gtk
  # The collection of tags in a `GtkTextBuffer`
  #
  # You may wish to begin by reading the
  # [text widget conceptual overview](section-text-widget.html),
  # which gives an overview of all the objects and data types
  # related to the text widget and how they work together.
  #
  # # GtkTextTagTables as GtkBuildable
  #
  # The `GtkTextTagTable` implementation of the `GtkBuildable` interface
  # supports adding tags by specifying “tag” as the “type” attribute
  # of a <child> element.
  #
  # An example of a UI definition fragment specifying tags:
  #
  #
  # WARNING: **⚠️ The following code is in xml ⚠️**
  # ```xml
  # <object class="GtkTextTagTable">
  #  <child type="tag">
  #    <object class="GtkTextTag"/>
  #  </child>
  # </object>
  # ```
  @[GObject::GeneratedWrapper]
  class TextTagTable < GObject::Object
    include Buildable

    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(TextTagTable, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `TextTagTable`.
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
      LibGtk.gtk_text_tag_table_get_type
    end

    # Add a tag to the table.
    #
    # The tag is assigned the highest priority in the table.
    #
    # @tag must not be in a tag table already, and may not have
    # the same name as an already-added tag.
    def add(tag : Gtk::TextTag) : Bool
      # gtk_text_tag_table_add: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_tag_table_add(@pointer, tag)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Calls @func on each tag in @table, with user data @data.
    #
    # Note that the table may not be modified while iterating
    # over it (you can’t add/remove tags).
    def foreach(func : Gtk::TextTagTableForeach, data : Pointer(Void)?) : Nil
      # gtk_text_tag_table_foreach: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibGtk.gtk_text_tag_table_foreach(@pointer, func, data)

      # Return value handling
    end

    # Returns the size of the table (number of tags)
    def size : Int32
      # gtk_text_tag_table_get_size: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_tag_table_get_size(@pointer)

      # Return value handling

      _retval
    end

    # Look up a named tag.
    def lookup(name : ::String) : Gtk::TextTag?
      # gtk_text_tag_table_lookup: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_tag_table_lookup(@pointer, name)

      # Return value handling

      Gtk::TextTag.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Remove a tag from the table.
    #
    # If a `GtkTextBuffer` has @table as its tag table, the tag is
    # removed from the buffer. The table’s reference to the tag is
    # removed, so the tag will end up destroyed if you don’t have
    # a reference to it.
    def remove(tag : Gtk::TextTag) : Nil
      # gtk_text_tag_table_remove: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_tag_table_remove(@pointer, tag)

      # Return value handling
    end

    # Emitted every time a new tag is added in the `GtkTextTagTable`.
    struct TagAddedSignal < GObject::Signal
      def name : String
        @detail ? "tag-added::#{@detail}" : "tag-added"
      end

      def connect(*, after : Bool = false, &block : Proc(Gtk::TextTag, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gtk::TextTag, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tag : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          tag = Gtk::TextTag.new(lib_tag, :none)
          ::Box(Proc(Gtk::TextTag, Nil)).unbox(_lib_box).call(tag)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::TextTagTable, Gtk::TextTag, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tag : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextTagTable.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          tag = Gtk::TextTag.new(lib_tag, :none)
          ::Box(Proc(Gtk::TextTagTable, Gtk::TextTag, Nil)).unbox(_lib_box).call(_sender, tag)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(tag : Gtk::TextTag) : Nil
        LibGObject.g_signal_emit_by_name(@source, "tag-added", tag)
      end
    end

    def tag_added_signal
      TagAddedSignal.new(self)
    end

    # Emitted every time a tag in the `GtkTextTagTable` changes.
    struct TagChangedSignal < GObject::Signal
      def name : String
        @detail ? "tag-changed::#{@detail}" : "tag-changed"
      end

      def connect(*, after : Bool = false, &block : Proc(Gtk::TextTag, Bool, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gtk::TextTag, Bool, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tag : Pointer(Void), lib_size_changed : LibC::Int, _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          tag = Gtk::TextTag.new(lib_tag, :none)
          size_changed = lib_size_changed
          ::Box(Proc(Gtk::TextTag, Bool, Nil)).unbox(_lib_box).call(tag, size_changed)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::TextTagTable, Gtk::TextTag, Bool, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tag : Pointer(Void), lib_size_changed : LibC::Int, _lib_box : Pointer(Void)) {
          _sender = Gtk::TextTagTable.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          tag = Gtk::TextTag.new(lib_tag, :none)
          size_changed = lib_size_changed
          ::Box(Proc(Gtk::TextTagTable, Gtk::TextTag, Bool, Nil)).unbox(_lib_box).call(_sender, tag, size_changed)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(tag : Gtk::TextTag, size_changed : Bool) : Nil
        LibGObject.g_signal_emit_by_name(@source, "tag-changed", tag, size_changed)
      end
    end

    def tag_changed_signal
      TagChangedSignal.new(self)
    end

    # Emitted every time a tag is removed from the `GtkTextTagTable`.
    #
    # The @tag is still valid by the time the signal is emitted, but
    # it is not associated with a tag table any more.
    struct TagRemovedSignal < GObject::Signal
      def name : String
        @detail ? "tag-removed::#{@detail}" : "tag-removed"
      end

      def connect(*, after : Bool = false, &block : Proc(Gtk::TextTag, Nil)) : GObject::SignalConnection
        connect(block, after: after)
      end

      def connect(handler : Proc(Gtk::TextTag, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tag : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          tag = Gtk::TextTag.new(lib_tag, :none)
          ::Box(Proc(Gtk::TextTag, Nil)).unbox(_lib_box).call(tag)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def connect(handler : Proc(Gtk::TextTagTable, Gtk::TextTag, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tag : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextTagTable.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          tag = Gtk::TextTag.new(lib_tag, :none)
          ::Box(Proc(Gtk::TextTagTable, Gtk::TextTag, Nil)).unbox(_lib_box).call(_sender, tag)
        }.pointer

        handler = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler)
      end

      def emit(tag : Gtk::TextTag) : Nil
        LibGObject.g_signal_emit_by_name(@source, "tag-removed", tag)
      end
    end

    def tag_removed_signal
      TagRemovedSignal.new(self)
    end
  end
end
