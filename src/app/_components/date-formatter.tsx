import { parseISO, format } from "date-fns";

type Props = {
  dateString: string;
};

const DateFormatter = ({ dateString }: Props) => {
   if (!dateString || isNaN(Date.parse(dateString))) {
    // 如果无效，可以返回一个默认值，如空内容、提示文本或一个安全的默认日期
    return <span></span>;
    // 或者 return null; 不渲染任何内容
  }
  const date = parseISO(dateString);
  return <time dateTime={dateString}>{format(date, "LLLL	d, yyyy")}</time>;
};

export default DateFormatter;
