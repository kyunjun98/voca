package vocabulary;

public class VocabularyDTO {

	private int id; //순번
	private String word; //단어
	private String description; //단어설명
	private String word_1; //고교영어1 단어
	private String description_1; //고교영어1 단어설명
	private String word_2; //고교영어2 단어
	private String description_2; //고교영어2 단어설명
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getWord_1() {
		return word_1;
	}
	public void setWord_1(String word_1) {
		this.word_1 = word_1;
	}
	public String getDescription_1() {
		return description_1;
	}
	public void setDescription_1(String description_1) {
		this.description_1 = description_1;
	}
	public String getWord_2() {
		return word_2;
	}
	public void setWord_2(String word_2) {
		this.word_2 = word_2;
	}
	public String getDescription_2() {
		return description_2;
	}
	public void setDescription_2(String description_2) {
		this.description_2 = description_2;
	}
	
}