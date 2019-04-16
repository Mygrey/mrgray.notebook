// ORM class for table 't_score_info'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Thu Nov 01 09:23:52 CST 2018
// For connector: org.apache.sqoop.manager.MySQLManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class t_score_info extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("sfzh", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        sfzh = (String)value;
      }
    });
    setters.put("last_month", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        last_month = (Integer)value;
      }
    });
    setters.put("acd_one", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        acd_one = (Integer)value;
      }
    });
    setters.put("acd_two", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        acd_two = (Integer)value;
      }
    });
    setters.put("acd_three", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        acd_three = (Integer)value;
      }
    });
    setters.put("vio_score", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        vio_score = (Integer)value;
      }
    });
    setters.put("acd_add", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        acd_add = (Integer)value;
      }
    });
    setters.put("black_mark", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        black_mark = (Integer)value;
      }
    });
    setters.put("score", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        score = (Double)value;
      }
    });
  }
  public t_score_info() {
    init0();
  }
  private String sfzh;
  public String get_sfzh() {
    return sfzh;
  }
  public void set_sfzh(String sfzh) {
    this.sfzh = sfzh;
  }
  public t_score_info with_sfzh(String sfzh) {
    this.sfzh = sfzh;
    return this;
  }
  private Integer last_month;
  public Integer get_last_month() {
    return last_month;
  }
  public void set_last_month(Integer last_month) {
    this.last_month = last_month;
  }
  public t_score_info with_last_month(Integer last_month) {
    this.last_month = last_month;
    return this;
  }
  private Integer acd_one;
  public Integer get_acd_one() {
    return acd_one;
  }
  public void set_acd_one(Integer acd_one) {
    this.acd_one = acd_one;
  }
  public t_score_info with_acd_one(Integer acd_one) {
    this.acd_one = acd_one;
    return this;
  }
  private Integer acd_two;
  public Integer get_acd_two() {
    return acd_two;
  }
  public void set_acd_two(Integer acd_two) {
    this.acd_two = acd_two;
  }
  public t_score_info with_acd_two(Integer acd_two) {
    this.acd_two = acd_two;
    return this;
  }
  private Integer acd_three;
  public Integer get_acd_three() {
    return acd_three;
  }
  public void set_acd_three(Integer acd_three) {
    this.acd_three = acd_three;
  }
  public t_score_info with_acd_three(Integer acd_three) {
    this.acd_three = acd_three;
    return this;
  }
  private Integer vio_score;
  public Integer get_vio_score() {
    return vio_score;
  }
  public void set_vio_score(Integer vio_score) {
    this.vio_score = vio_score;
  }
  public t_score_info with_vio_score(Integer vio_score) {
    this.vio_score = vio_score;
    return this;
  }
  private Integer acd_add;
  public Integer get_acd_add() {
    return acd_add;
  }
  public void set_acd_add(Integer acd_add) {
    this.acd_add = acd_add;
  }
  public t_score_info with_acd_add(Integer acd_add) {
    this.acd_add = acd_add;
    return this;
  }
  private Integer black_mark;
  public Integer get_black_mark() {
    return black_mark;
  }
  public void set_black_mark(Integer black_mark) {
    this.black_mark = black_mark;
  }
  public t_score_info with_black_mark(Integer black_mark) {
    this.black_mark = black_mark;
    return this;
  }
  private Double score;
  public Double get_score() {
    return score;
  }
  public void set_score(Double score) {
    this.score = score;
  }
  public t_score_info with_score(Double score) {
    this.score = score;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof t_score_info)) {
      return false;
    }
    t_score_info that = (t_score_info) o;
    boolean equal = true;
    equal = equal && (this.sfzh == null ? that.sfzh == null : this.sfzh.equals(that.sfzh));
    equal = equal && (this.last_month == null ? that.last_month == null : this.last_month.equals(that.last_month));
    equal = equal && (this.acd_one == null ? that.acd_one == null : this.acd_one.equals(that.acd_one));
    equal = equal && (this.acd_two == null ? that.acd_two == null : this.acd_two.equals(that.acd_two));
    equal = equal && (this.acd_three == null ? that.acd_three == null : this.acd_three.equals(that.acd_three));
    equal = equal && (this.vio_score == null ? that.vio_score == null : this.vio_score.equals(that.vio_score));
    equal = equal && (this.acd_add == null ? that.acd_add == null : this.acd_add.equals(that.acd_add));
    equal = equal && (this.black_mark == null ? that.black_mark == null : this.black_mark.equals(that.black_mark));
    equal = equal && (this.score == null ? that.score == null : this.score.equals(that.score));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof t_score_info)) {
      return false;
    }
    t_score_info that = (t_score_info) o;
    boolean equal = true;
    equal = equal && (this.sfzh == null ? that.sfzh == null : this.sfzh.equals(that.sfzh));
    equal = equal && (this.last_month == null ? that.last_month == null : this.last_month.equals(that.last_month));
    equal = equal && (this.acd_one == null ? that.acd_one == null : this.acd_one.equals(that.acd_one));
    equal = equal && (this.acd_two == null ? that.acd_two == null : this.acd_two.equals(that.acd_two));
    equal = equal && (this.acd_three == null ? that.acd_three == null : this.acd_three.equals(that.acd_three));
    equal = equal && (this.vio_score == null ? that.vio_score == null : this.vio_score.equals(that.vio_score));
    equal = equal && (this.acd_add == null ? that.acd_add == null : this.acd_add.equals(that.acd_add));
    equal = equal && (this.black_mark == null ? that.black_mark == null : this.black_mark.equals(that.black_mark));
    equal = equal && (this.score == null ? that.score == null : this.score.equals(that.score));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.sfzh = JdbcWritableBridge.readString(1, __dbResults);
    this.last_month = JdbcWritableBridge.readInteger(2, __dbResults);
    this.acd_one = JdbcWritableBridge.readInteger(3, __dbResults);
    this.acd_two = JdbcWritableBridge.readInteger(4, __dbResults);
    this.acd_three = JdbcWritableBridge.readInteger(5, __dbResults);
    this.vio_score = JdbcWritableBridge.readInteger(6, __dbResults);
    this.acd_add = JdbcWritableBridge.readInteger(7, __dbResults);
    this.black_mark = JdbcWritableBridge.readInteger(8, __dbResults);
    this.score = JdbcWritableBridge.readDouble(9, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.sfzh = JdbcWritableBridge.readString(1, __dbResults);
    this.last_month = JdbcWritableBridge.readInteger(2, __dbResults);
    this.acd_one = JdbcWritableBridge.readInteger(3, __dbResults);
    this.acd_two = JdbcWritableBridge.readInteger(4, __dbResults);
    this.acd_three = JdbcWritableBridge.readInteger(5, __dbResults);
    this.vio_score = JdbcWritableBridge.readInteger(6, __dbResults);
    this.acd_add = JdbcWritableBridge.readInteger(7, __dbResults);
    this.black_mark = JdbcWritableBridge.readInteger(8, __dbResults);
    this.score = JdbcWritableBridge.readDouble(9, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(sfzh, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(last_month, 2 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(acd_one, 3 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(acd_two, 4 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(acd_three, 5 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(vio_score, 6 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(acd_add, 7 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(black_mark, 8 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeDouble(score, 9 + __off, 8, __dbStmt);
    return 9;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(sfzh, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(last_month, 2 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(acd_one, 3 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(acd_two, 4 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(acd_three, 5 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(vio_score, 6 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(acd_add, 7 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeInteger(black_mark, 8 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeDouble(score, 9 + __off, 8, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.sfzh = null;
    } else {
    this.sfzh = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.last_month = null;
    } else {
    this.last_month = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.acd_one = null;
    } else {
    this.acd_one = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.acd_two = null;
    } else {
    this.acd_two = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.acd_three = null;
    } else {
    this.acd_three = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.vio_score = null;
    } else {
    this.vio_score = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.acd_add = null;
    } else {
    this.acd_add = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.black_mark = null;
    } else {
    this.black_mark = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.score = null;
    } else {
    this.score = Double.valueOf(__dataIn.readDouble());
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.sfzh) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sfzh);
    }
    if (null == this.last_month) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.last_month);
    }
    if (null == this.acd_one) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.acd_one);
    }
    if (null == this.acd_two) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.acd_two);
    }
    if (null == this.acd_three) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.acd_three);
    }
    if (null == this.vio_score) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.vio_score);
    }
    if (null == this.acd_add) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.acd_add);
    }
    if (null == this.black_mark) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.black_mark);
    }
    if (null == this.score) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeDouble(this.score);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.sfzh) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, sfzh);
    }
    if (null == this.last_month) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.last_month);
    }
    if (null == this.acd_one) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.acd_one);
    }
    if (null == this.acd_two) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.acd_two);
    }
    if (null == this.acd_three) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.acd_three);
    }
    if (null == this.vio_score) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.vio_score);
    }
    if (null == this.acd_add) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.acd_add);
    }
    if (null == this.black_mark) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.black_mark);
    }
    if (null == this.score) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeDouble(this.score);
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(sfzh==null?"null":sfzh, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(last_month==null?"null":"" + last_month, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(acd_one==null?"null":"" + acd_one, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(acd_two==null?"null":"" + acd_two, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(acd_three==null?"null":"" + acd_three, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(vio_score==null?"null":"" + vio_score, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(acd_add==null?"null":"" + acd_add, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(black_mark==null?"null":"" + black_mark, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(score==null?"null":"" + score, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(sfzh==null?"null":sfzh, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(last_month==null?"null":"" + last_month, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(acd_one==null?"null":"" + acd_one, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(acd_two==null?"null":"" + acd_two, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(acd_three==null?"null":"" + acd_three, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(vio_score==null?"null":"" + vio_score, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(acd_add==null?"null":"" + acd_add, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(black_mark==null?"null":"" + black_mark, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(score==null?"null":"" + score, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.sfzh = null; } else {
      this.sfzh = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.last_month = null; } else {
      this.last_month = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.acd_one = null; } else {
      this.acd_one = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.acd_two = null; } else {
      this.acd_two = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.acd_three = null; } else {
      this.acd_three = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.vio_score = null; } else {
      this.vio_score = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.acd_add = null; } else {
      this.acd_add = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.black_mark = null; } else {
      this.black_mark = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.score = null; } else {
      this.score = Double.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.sfzh = null; } else {
      this.sfzh = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.last_month = null; } else {
      this.last_month = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.acd_one = null; } else {
      this.acd_one = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.acd_two = null; } else {
      this.acd_two = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.acd_three = null; } else {
      this.acd_three = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.vio_score = null; } else {
      this.vio_score = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.acd_add = null; } else {
      this.acd_add = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.black_mark = null; } else {
      this.black_mark = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.score = null; } else {
      this.score = Double.valueOf(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    t_score_info o = (t_score_info) super.clone();
    return o;
  }

  public void clone0(t_score_info o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("sfzh", this.sfzh);
    __sqoop$field_map.put("last_month", this.last_month);
    __sqoop$field_map.put("acd_one", this.acd_one);
    __sqoop$field_map.put("acd_two", this.acd_two);
    __sqoop$field_map.put("acd_three", this.acd_three);
    __sqoop$field_map.put("vio_score", this.vio_score);
    __sqoop$field_map.put("acd_add", this.acd_add);
    __sqoop$field_map.put("black_mark", this.black_mark);
    __sqoop$field_map.put("score", this.score);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("sfzh", this.sfzh);
    __sqoop$field_map.put("last_month", this.last_month);
    __sqoop$field_map.put("acd_one", this.acd_one);
    __sqoop$field_map.put("acd_two", this.acd_two);
    __sqoop$field_map.put("acd_three", this.acd_three);
    __sqoop$field_map.put("vio_score", this.vio_score);
    __sqoop$field_map.put("acd_add", this.acd_add);
    __sqoop$field_map.put("black_mark", this.black_mark);
    __sqoop$field_map.put("score", this.score);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
